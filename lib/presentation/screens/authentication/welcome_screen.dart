import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../widgets/active_button.dart';

/// -----------------------------
/// Welcome Screen
/// -----------------------------
/// This is the first screen of the app.
/// Contains:
/// - App logo centered vertically
/// - "Sign in" and "Sign up" buttons fixed at the bottom
/// -----------------------------
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// Centered Logo
              Expanded(
                child: Center(
                  child: Assets.images.mainLogo.image(
                    width: 195,
                    height: 270,
                  ),
                ),
              ),

              /// Buttons at the bottom
              Column(
                children: [
                  ActiveButton(
                    text: 'Log in',
                    onPressed: () =>
                        context.go(RoutePath.signInScreen.addBasePath),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50.0,
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFFE8632C),
                        side:
                        const BorderSide(color: Color(0xFFE8632C), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () =>
                          context.go(RoutePath.signUp.addBasePath),
                      child: const Text(
                        'Create an account',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
