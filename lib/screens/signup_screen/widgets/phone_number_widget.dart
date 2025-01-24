import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:login_app/theme_data/fonts.dart';
import 'package:login_app/theme_data/palette.dart';

class PhoneNumberComponent extends StatefulWidget {
  final String hint;
  final String? Function(String?)? validator;
  final Function(String phoneNumber)? onInputChanged;

  const PhoneNumberComponent(
      {super.key, required this.hint, this.validator, this.onInputChanged});
  @override
  State<PhoneNumberComponent> createState() => _PhoneNumberComponentState();
}

class _PhoneNumberComponentState extends State<PhoneNumberComponent> {
  final TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'PK', dialCode: '+92');
  String? phoneNumber;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 14,
            offset: const Offset(2, 3), // Shadow position
          ),
        ],
      ),
      child: InternationalPhoneNumberInput(
        // hintText: 'Search',
        // isEnabled: false,
        validator: widget.validator,
        searchBoxDecoration: InputDecoration(
          isDense: true,
          labelText: 'Search Country',
          fillColor: Palette.textfieldColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        onInputChanged: (PhoneNumber number) {
          phoneNumber = '${number.dialCode} ${controller.text}';
          widget.onInputChanged?.call(phoneNumber!);
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DROPDOWN,
          leadingPadding: 10,
          setSelectorButtonAsPrefixIcon: true,
          // trailingSpace: false,
        ),

        textStyle: CustomFontStyle.regularText
            .copyWith(color: Colors.black, height: 1.5),
        // ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        initialValue: number,
        textFieldController: controller,
        formatInput: true,
        inputDecoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Palette.textfieldColor,
          hintText: widget.hint,
          hintStyle: CustomFontStyle.regularText
              .copyWith(color: Colors.grey, height: 0),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
        ),

        // inputBorder: const OutlineInputBorder(
        //     borderSide: BorderSide.none),
        selectorTextStyle: CustomFontStyle.regularText.copyWith(height: 1.5),
        keyboardType: TextInputType.phone,
      ),
    );
  }
}
