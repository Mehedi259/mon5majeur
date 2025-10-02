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
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF004AAD)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
