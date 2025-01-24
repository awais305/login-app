import 'package:flutter/material.dart';

String? Function(String?) get mandatoryValidator =>
    (String? val) => val?.isEmpty ?? true ? "This field is mandatory" : null;

String? Function(String?) get emailValidator => (String? email) => RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email ?? "")
        ? null
        : "Enter a valid email";

String? Function(String?) get passwordValidator => (String? password) =>
    (password?.length ?? 0) < 8 ? "Minumum length must be 8 characters" : null;

void snack(BuildContext context, String message, {bool info = true}) {
  debugPrint(message);
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(milliseconds: 2000),
    backgroundColor: info ? Colors.green : Colors.red.shade600,
    // behavior: SnackBarBehavior.floating,
    content: Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.white,
          ),
    ),
  ));
}
