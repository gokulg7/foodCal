import 'package:flutter/material.dart';
import 'package:mini_proj/src/constants/colors.dart';

class HighlightRoundTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final FormFieldValidator<String>? validator;

  const HighlightRoundTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        prefixIcon: prefixIcon,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
