import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:mon5majeur/core/routes/routes.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../widgets/active_button.dart';
import '../../widgets/custom_bottons/social_login_button.dart';
import '../../widgets/password_input.dart';
import '../../widgets/text_input_box.dart';

final logger = Logger();

/// SignUpScreen
/// ----------------------------------------------------
/// This screen allows users to create a new account.
/// Includes:
/// - Email input
/// - Password and Confirm Password fields
/// - Sign Up button
/// - Navigation to Sign In screen
/// - Social login options (Apple / Google)
/// ----------------------------------------------------
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Back Button
              GestureDetector(
                onTap: () => context.pop(),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Assets.icons.backButton.image(
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Screen Title
              const Center(
                child: Text(
                  "Create an account",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// Email Input Field
              TextInputBox(
                controller: _emailController,
                label: "Email",
                hintText: "Enter your email",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Assets.icons.email.image(width: 20, height: 20),
                ),
              ),

              const SizedBox(height: 20),

              /// Password Input Field
              PasswordInput(
                controller: _passwordController,
                label: "Password",
              ),

              const SizedBox(height: 20),

              /// Confirm Password Input Field
              PasswordInput(
                controller: _confirmPasswordController,
                label: "Confirm Password",
              ),

              const SizedBox(height: 30),

              /// Sign Up Button
              ActiveButton(
                text: "Sign up",
                onPressed: () {
                  context.go(RoutePath.verifyRegistration.addBasePath);
                  logger.i("Email: ${_emailController.text}");
                  logger.i("Password: ${_passwordController.text}");
                  logger.i(
                      "Confirm Password: ${_confirmPasswordController.text}");
                },
              ),

              const SizedBox(height: 20),

              /// Navigate to Sign In
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Do you have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => context.go(RoutePath.signInScreen.addBasePath),
                    child: const Text(
                      " Sign in",
                      style: TextStyle(
                        color: Color(0xFFE8632C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Divider with "Or"
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade700)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Or",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade700)),
                ],
              ),

              const SizedBox(height: 20),

              /// Google Login Button
              SocialLoginButton(
                text: 'Continue with Google account',
                icon: Assets.icons.google.image(
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  logger.i('Google Sign Up');
                  // Implement Google Sign Up
                },
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderColor: const Color(0xFFE0E0E0),
              ),

              const SizedBox(height: 16),

              /// Apple Login Button
              SocialLoginButton(
                text: 'Continue with Apple account',
                icon: Assets.icons.apple.image(
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                onPressed: () {
                  logger.i('Apple Sign Up');
                  // Implement Apple Sign Up
                },
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderColor: const Color(0xFFE0E0E0),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
