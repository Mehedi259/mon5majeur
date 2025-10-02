import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../widgets/active_button.dart';

class PasswordResetScreen extends StatelessWidget {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView( // Prevents overflow on small screens
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button (using AssetGen)
              GestureDetector(
                onTap: () {
                  context.go('/signIn');
                },
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Assets.icons.backButton.image(
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 71),

              // Title text
              const Text(
                'Password reset',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  height: 20 / 18,
                  letterSpacing: -0.5,
                  backgroundColor: Colors.transparent,
                ),
              ),

              const SizedBox(height: 12),

              // Description text
              const Text(
                'Your password has been successfully reset. '
                    'Click confirm to set a new password.',
                style: TextStyle(
                  color: Color(0xFFB0B3B8),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 25 / 14,
                  backgroundColor: Colors.transparent,
                ),
              ),

              const SizedBox(height: 50),

              // Confirm button
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ActiveButton(
                  text: 'Confirm',
                  onPressed: () {
                    context.go('/updatePassword');
                  },
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
