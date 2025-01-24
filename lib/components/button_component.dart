import 'package:flutter/material.dart';
import 'package:login_app/theme_data/palette.dart';

import '../theme_data/fonts.dart';

class ButtonComponent extends StatefulWidget {
  final String? iconPath;
  final Color? iconColor;
  final String text;
  final double height;
  final double maxWidth;
  final Color? backgroundColor;
  final bool isBorderedButton;
  final FontWeight fontWeight;
  final double fontSize;
  final Color? fontColor;
  final Color? borderColor;
  final double borderRadius;
  final Function()? onPressed;

  const ButtonComponent({
    super.key,
    this.iconPath,
    this.iconColor,
    required this.text,
    this.height = 58,
    this.maxWidth = double.infinity,
    this.borderRadius = 16.0,
    this.isBorderedButton = false,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 16,
    this.fontColor,
    this.borderColor,
    this.backgroundColor,
    this.onPressed,
  });

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.isBorderedButton
            ? Colors.white
            : widget.backgroundColor ?? Palette.primary,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: widget.isBorderedButton
            ? Border.all(color: widget.borderColor ?? Palette.primary)
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          // splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: widget.onPressed,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.iconPath != null)
                Image.asset(
                  widget.iconPath!,
                  width: 16,
                  color: widget.iconColor,
                ),
              if (widget.iconPath != null) const SizedBox(width: 20),
              Text(
                widget.text,
                style: CustomFontStyle.regularText.copyWith(
                    color: widget.isBorderedButton
                        ? Palette.primary
                        : widget.fontColor ??
                            widget.borderColor ??
                            Colors.white,
                    fontSize: widget.fontSize,
                    height: 1.3,
                    letterSpacing: 0.5,
                    fontWeight: widget.fontWeight),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
