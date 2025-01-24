import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_app/components/button_component.dart';
import 'package:login_app/components/textfield_component.dart';
import 'package:login_app/providers/user_provider.dart';
import 'package:login_app/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:login_app/screens/login_screen/widgets/checkbox_widget.dart';
import 'package:login_app/screens/signup_screen/signup_screen.dart';
import 'package:login_app/theme_data/fonts.dart';
import 'package:login_app/theme_data/palette.dart';
import 'package:login_app/utils/snippets.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';
import '../signup_screen/widgets/social_buttons_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool? isRememberMe = false;
  bool showPassword = true;

  @override
  void initState() {
    if (kDebugMode) {
      emailController.text = 'user@speedforce.com';
      passwordController.text = 'password';
    }
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          children: [
            SizedBox(height: kToolbarHeight + 20),
            Hero(
              tag: 'logo',
              child: Image.asset(
                AssetImages.logo,
                // height: 300,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Welcome Back',
              style: CustomFontStyle.boldText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextFieldComponent(
              hintText: 'Email',
              validator: emailValidator,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              prefixIconPath: AssetImages.message,
            ),
            const SizedBox(height: 30),
            TextFieldComponent(
              hintText: 'Password',
              validator: passwordValidator,
              controller: passwordController,
              prefixIconPath: AssetImages.lock,
              obscureText: showPassword,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () => setState(() => showPassword = !showPassword),
                  child: Icon(
                    !showPassword ? Icons.visibility_off : Icons.visibility,
                    color: Palette.purple,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            CheckboxWidget(
              text: 'Remember Me',
              value: isRememberMe,
              onChanged: (value) {
                setState(() => isRememberMe = value);
              },
            ),
            const SizedBox(height: 30),
            Consumer<UserProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return SizedBox(
                    height: 52,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation(Palette.primary),
                      ),
                    ),
                  );
                } else {
                  return ButtonComponent(
                    text: 'Login',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _submit(provider);
                      }
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Forgot password?',
              style: CustomFontStyle.regularText.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Palette.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SocialButtonsWidget(),
            const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Don\'t Have an account? ',
                    style: CustomFontStyle.regularText
                        .copyWith(fontSize: 16, color: Palette.lightGrey),
                  ),
                  TextSpan(
                    text: 'Sign Up',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen())),
                    style: CustomFontStyle.regularText.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Palette.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _submit(UserProvider provider) async {
    await provider.login(
      email: emailController.text,
      password: passwordController.text,
    );

    if (mounted && provider.loginSuccess != null) {
      snack(context, provider.loginSuccess!);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => BottomNavigationScreen(),
        ),
      );
    }

    if (mounted && provider.loginError != null) {
      showAdaptiveDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog.adaptive(
          title: Text('Error!'),
          backgroundColor: Colors.white,
          insetPadding: EdgeInsets.all(10),
          content: Text(provider.loginError!),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('OK',
                  style: CustomFontStyle.regularText
                      .copyWith(color: Palette.blue)),
            ),
          ],
        ),
      );
      return;
    }
  }
}
