import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../theme_data/fonts.dart';
import '../../../theme_data/palette.dart';

class DropdownWidget extends StatelessWidget {
  final String? selectedGender;
  final List<String> items;
  final String? Function(String?)? validator;
  final Function(String? gender)? onChanged;

  const DropdownWidget(
      {super.key,
      required this.selectedGender,
      required this.items,
      this.validator,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            blurRadius: 14,
            offset: const Offset(2, 3), // Shadow position
          ),
        ],
      ),
      child: DropdownButtonFormField(
        validator: validator,
        value: selectedGender,
        isExpanded: true,
        icon: Image.asset(AssetImages.downArrow, width: 20),
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 12.0, left: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                selectedGender == null ? 'Gender' : selectedGender!,
                style: selectedGender == null
                    ? CustomFontStyle.regularText
                        .copyWith(color: Palette.lightGrey)
                    : CustomFontStyle.regularText,
              ),
            ),
          ),
          suffixIconConstraints: BoxConstraints(maxWidth: 40),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset(AssetImages.downArrow, width: 20),
          ),
        ),
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Align(
                  alignment: Alignment.centerLeft,
                  // Change to centerRight if required
                  child: Text(
                    e.toString(),
                    style: CustomFontStyle.regularText
                        .copyWith(color: Colors.black),
                    textAlign:
                        TextAlign.center, // Centers the text inside the item
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
