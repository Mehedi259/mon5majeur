import 'package:flutter/material.dart';

class ActiveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;

  const ActiveButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity, // Full width across device
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF004AAD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
