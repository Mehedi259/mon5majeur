import 'package:flutter/material.dart';

import '../../core/custom_assets/assets.gen.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const PasswordInput({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscurePassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.white54),
        hintText: "********",
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: _obscurePassword
                ? Assets.icons.eyeOff.image(width: 20, height: 20)
                : Assets.icons.eye.image(width: 20, height: 20),
          ),
        ),
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
