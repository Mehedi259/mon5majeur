import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mon5majeur/core/routes/routes.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../widgets/hover_effect_button.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  bool isButtonActive = false;

  @override
  void initState() {
    super.initState();
    // Listen for text changes to enable/disable button dynamically
    _emailController.addListener(() {
      setState(() {
        isButtonActive = _emailController.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // Dispose controller to free memory
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        // Scrollable body for preventing overflow on small devices
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Back button (top-left)
              Positioned(
                top: 30,
                left: 30,
                child: GestureDetector(
                  onTap: () => context.go(RoutePath.signInScreen.addBasePath),
                  child: Assets.icons.backButton.image(
                    width: 30,
                    height: 30,
                  ),
                ),
              ),

              // Main content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 138),

                    // Screen title
                    Text(
                      'Forgot password',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: -0.5,
                        color: Colors.white,
                        height: 20 / 18,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Instruction text
                    const Text(
                      'Please enter your email to reset the password',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: -0.5,
                        color: Color(0xFFB0B3B8),
                        height: 20 / 14,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Email field label
                    const Text(
                      'Your Email',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: -0.5,
                        color: Colors.white,
                        height: 20 / 16,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Email input box
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFB0B3B8),
                          width: 2,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: TextField(
                        controller: _emailController,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: -0.5,
                          color: Colors.white,
                          height: 20 / 14,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            letterSpacing: -0.5,
                            color: Color(0xFFB0B3B8),
                            height: 20 / 14,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 26),

                    // Reset password button
                    HoverEffectButton(
                      isActive: isButtonActive,
                      onTap: () {
                        if (isButtonActive) {
                          GoRouter.of(context).push(
                            RoutePath.otpScreen.addBasePath,
                            extra: _emailController.text.trim(),
                          );
                        }
                      },
                      text: 'Reset Password',
                    ),

                    const SizedBox(height: 20), // Extra padding for bottom spacing
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
