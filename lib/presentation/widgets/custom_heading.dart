import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/custom_assets/assets.gen.dart';

/// Reusable heading widget for multiple screens.
/// Supports both emoji and asset icons.
class CustomHeading extends StatelessWidget {
  final String title;
  final String? emoji; // optional text emoji
  final AssetGenImage? iconAsset; // optional image asset
  final String? routePath; // for back navigation
  final bool showBackButton;
  final bool showLogo;

  const CustomHeading({
    super.key,
    required this.title,
    this.emoji,
    this.iconAsset,
    this.routePath,
    this.showBackButton = true,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.transparent,
      child: Row(
        children: [
          /// 🔙 Back Button
          if (showBackButton)
            GestureDetector(
              onTap: () {
                if (routePath != null && routePath!.isNotEmpty) {
                  context.go(routePath!);
                } else {
                  context.pop();
                }
              },
              child: SizedBox(
                width: 30,
                height: 30,
                child: Assets.icons.backButton.image(
                  fit: BoxFit.contain,
                ),
              ),
            )
          else
            const SizedBox(width: 30, height: 30),

          const Spacer(),

          /// 🏷️ Title + Emoji/Icon (center)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  height: 22 / 20,
                  letterSpacing: 0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              if (iconAsset != null)
                SizedBox(
                  width: 20,
                  height: 20,
                  child: iconAsset!.image(
                    fit: BoxFit.contain,
                  ),
                )
              else if (emoji != null && emoji!.isNotEmpty)
                Text(
                  emoji!,
                  style: const TextStyle(fontSize: 20),
                ),
            ],
          ),

          const Spacer(),


        ],
      ),
    );
  }
}
