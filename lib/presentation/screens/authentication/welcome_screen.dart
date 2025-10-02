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
/// - App logo
/// - "Sign in" button
/// - "Sign up" button
/// -----------------------------
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      /// SafeArea ensures content does not overlap system UI (notch, status bar).
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            /// Main content column
            child: Column(
              children: [
                const SizedBox(height: 300),

                /// App Logo
                Center(
                  child: Assets.images.mainLogo.image(
                    width: 194.68,
                    height: 76.91,
                  ),
                ),

                const SizedBox(height: 250), // replaces Spacer to allow scrolling

                /// Sign in button
                ActiveButton(
                  text: 'Sign in',
                  onPressed: () => context.go(RoutePath.signInScreen.addBasePath),
                ),
                const SizedBox(height: 10),

                /// Sign up button
                SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF004AAD),
                      side: const BorderSide(color: Color(0xFF004AAD), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => context.go(RoutePath.signUp.addBasePath),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
