import 'package:flutter/material.dart';

class TextInputBox extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final Widget? suffixIcon;

  const TextInputBox({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Color(0xFFB1B1B1)),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFFB1B1B1)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFB1B1B1)),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFB1B1B1)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE8632C)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
