import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:mon5majeur/core/routes/routes.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../widgets/active_button.dart';
import '../../widgets/password_input.dart';
import '../../widgets/text_input_box.dart';

final logger = Logger();

/// SignUpScreen
/// ----------------------------------------------------
/// This screen allows users to create a new account.
/// Includes:
/// - Username input
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
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      /// Prevents content from overlapping with system UI
      body: SafeArea(
        /// Enables scrolling to avoid overflow on small devices
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Screen Title
              const Text(
                "Create an account",
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xFF004AAD),
                ),
              ),

              const SizedBox(height: 40),

              /// Full Name Input Field
              TextInputBox(
                controller: _fullnameController,
                label: "Full Name",
                hintText: "Enter your full name",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Assets.icons.user.image(width: 20, height: 20),
                ),
              ),

              const SizedBox(height: 20),

              /// Username Input Field
              TextInputBox(
                controller: _usernameController,
                label: "Username",
                hintText: "Enter your user name",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Assets.icons.user.image(width: 20, height: 20),
                ),
              ),

              const SizedBox(height: 20),

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
                  context.go(RoutePath.signInScreen.addBasePath);

                  logger.i("Fullname: ${_fullnameController.text}");
                  logger.i("Username: ${_usernameController.text}");
                  logger.i("Email: ${_emailController.text}");
                  logger.i("Password: ${_passwordController.text}");
                  logger.i("Confirm Password: ${_confirmPasswordController.text}");
                },
              ),

              const SizedBox(height: 20),

              /// Navigate to Sign In
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do you have an account?", style: TextStyle(color: Colors.white)),
                  GestureDetector(
                    onTap: () => context.go(RoutePath.signInScreen.addBasePath),
                    child: const Text(
                      " Sign in",
                      style: TextStyle(
                        color: Color(0xFF004AAD),
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
                    child: Text("Or", style: TextStyle(color: Colors.white)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade700)),
                ],
              ),

              const SizedBox(height: 16),

              /// Social Login Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(onTap: () {}, child: Assets.icons.apple.image(height: 48)),
                  const SizedBox(width: 24),
                  InkWell(onTap: () {}, child: Assets.icons.google.image(height: 48)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
