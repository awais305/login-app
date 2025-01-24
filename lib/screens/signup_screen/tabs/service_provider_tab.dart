import 'package:flutter/material.dart';
import 'package:login_app/components/button_component.dart';
import 'package:login_app/components/textfield_component.dart';
import 'package:login_app/screens/signup_screen/widgets/phone_number_widget.dart';
import 'package:login_app/screens/signup_screen/widgets/social_buttons_widget.dart';
import 'package:login_app/utils/constants.dart';
import 'package:login_app/theme_data/fonts.dart';
import 'package:login_app/theme_data/palette.dart';
import 'package:login_app/utils/snippets.dart';

import '../widgets/dropdown_widget.dart';
import '../widgets/terms_policy_widget.dart';

class ServiceProviderTab extends StatefulWidget {
  const ServiceProviderTab({super.key});

  @override
  State<ServiceProviderTab> createState() => _ServiceProviderTabState();
}

class _ServiceProviderTabState extends State<ServiceProviderTab> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? selectedGender;
  List<String> genders = ['Male', 'Female'];

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            spacing: 24,
            children: [
              TextFieldComponent(
                hintText: 'First Name',
                validator: mandatoryValidator,
                controller: firstNameController,
              ),
              TextFieldComponent(
                validator: mandatoryValidator,
                controller: lastNameController,
                hintText: 'Last Name',
              ),
              TextFieldComponent(
                hintText: 'Email',
                validator: emailValidator,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                suffixIconPath: AssetImages.email,
              ),
              DropdownWidget(
                validator: mandatoryValidator,
                selectedGender: selectedGender,
                items: genders,
                onChanged: (gender) {
                  setState(() => selectedGender = gender.toString());
                },
              ),
              PhoneNumberComponent(
                validator: mandatoryValidator,
                hint: 'Phone Number',
              ),
              TextFieldComponent(
                hintText: 'Password',
                validator: passwordValidator,
                controller: passwordController,
                suffixIconPath: AssetImages.lockOutlined,
              ),
              TextFieldComponent(
                hintText: 'Confirm Password',
                validator: passwordValidator,
                controller: confirmPasswordController,
                suffixIconPath: AssetImages.lockOutlined,
              ),
              const TermsPolicyWidget(),
              ButtonComponent(
                text: 'Sign Up',
                onPressed: () {
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    snack(context, "Passwords don't match", info: false);
                    return;
                  }
                  if (_formKey.currentState?.validate() ?? false) {
                    snack(context, 'Form Validated');
                  }
                },
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: 'Already Have an account? ',
                      style: CustomFontStyle.regularText.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Palette.lightGrey),
                    ),
                    TextSpan(
                      text: 'Log In',
                      style: CustomFontStyle.regularText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Palette.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SocialButtonsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
