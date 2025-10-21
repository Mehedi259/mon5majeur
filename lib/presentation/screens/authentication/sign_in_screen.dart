import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../widgets/active_button.dart';
import '../../widgets/custom_bottons/social_login_button.dart';
import '../../widgets/password_input.dart';
import '../../widgets/text_input_box.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

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

              /// Title
              const Center(
                child: Text(
                  "Log in",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              /// Email Input
              TextInputBox(
                controller: _emailController,
                label: "Email Address",
                hintText: "Enter your email",
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Assets.icons.email.image(width: 20, height: 20),
                ),
              ),
              const SizedBox(height: 20),

              /// Password Input
              PasswordInput(
                controller: _passwordController,
                label: "Password",
              ),
              const SizedBox(height: 20),

              /// Remember Me & Forgot Password
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _rememberMe = !_rememberMe;
                      });
                    },
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(3),
                        color: _rememberMe
                            ? const Color(0xFF004AAD)
                            : Colors.transparent,
                      ),
                      child: _rememberMe
                          ? const Icon(Icons.check,
                          size: 14, color: Colors.white)
                          : null,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Remember me",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () =>
                        context.go(RoutePath.forgetPassword.addBasePath),
                    child: const Text(
                      "Forget password?",
                      style: TextStyle(color: Color(0xFFE8632C)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              /// Sign In Button
              ActiveButton(
                text: "log in",
                onPressed: () {
                  context.go(RoutePath.profileSetup.addBasePath);
                  debugPrint("Email: ${_emailController.text}");
                  debugPrint("Password: ${_passwordController.text}");
                },
              ),
              const SizedBox(height: 20),

              /// Sign Up Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => context.go(RoutePath.signUp.addBasePath),
                    child: const Text(
                      " Create an account ",
                      style: TextStyle(
                        color: Color(0xFFE8632C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Divider
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
                  debugPrint('Google Sign In');
                  // Implement Google Sign In
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
                  debugPrint('Apple Sign In');
                  // Implement Apple Sign In
                },
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderColor: const Color(0xFFE0E0E0),
              ),

            ],
          ),
        ),
      ),
    );
  }
}