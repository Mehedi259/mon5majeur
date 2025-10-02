import 'package:flutter/material.dart';

class HoverEffectButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isActive;
  final String text;

  const HoverEffectButton({
    super.key,
    required this.onTap,
    required this.isActive,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isActive ? const Color(0xFF004AAD) : const Color(0x80004AAD),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            letterSpacing: -0.5,
            color: Colors.white,
            height: 20 / 16,
          ),
        ),
      ),
    );
  }
}
