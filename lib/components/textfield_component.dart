import 'package:flutter/material.dart';

import '../theme_data/fonts.dart';
import '../theme_data/palette.dart';

class TextFieldComponent extends StatefulWidget {
  final String? Function(String?)? validator;
  final String? hintText;
  final String? prefixIconPath;
  final Widget? suffixIcon;
  final String? suffixIconPath;
  final bool obscureText;
  final double radius;
  final double fontSize;
  final TextInputType keyboardType;
  final Function(String query)? onChanged;

  final TextEditingController? controller;

  const TextFieldComponent({
    super.key,
    this.validator,
    this.controller,
    this.prefixIconPath,
    this.hintText,
    this.suffixIconPath,
    this.suffixIcon,
    this.obscureText = false,
    this.radius = 10.0,
    this.fontSize = 15,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 14,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        // enabled: enabled,
        cursorColor: Palette.primary,
        validator: widget.validator,
        onChanged: widget.onChanged,
        textAlignVertical: TextAlignVertical.bottom,
        controller: widget.controller,
        style: TextStyle(
          fontSize: 15,
          fontStyle: FontStyle.normal,
          color: Colors.black,
          letterSpacing: 0,
        ),
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Palette.textfieldColor,
          contentPadding:
              EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
          prefixIcon: widget.prefixIconPath == null
              ? null
              : Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 17.0, end: 14),
                  child: Image.asset(
                    widget.prefixIconPath!,
                    width: 20,
                    fit: BoxFit.contain,
                    color: Palette.secondary,
                  ),
                ),
          suffixIcon: widget.suffixIcon ??
              (widget.suffixIconPath == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Image.asset(
                        widget.suffixIconPath!,
                        width: 20,
                        fit: BoxFit.contain,
                        color: Color(0xFFA3D1FF),
                      ),
                    )),
          suffixIconConstraints: BoxConstraints(maxWidth: 40),
          hintText: widget.hintText,
          hintStyle: CustomFontStyle.regularText
              .copyWith(color: Colors.grey, fontSize: widget.fontSize),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
