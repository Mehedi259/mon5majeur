import 'package:flutter/material.dart';
import 'package:mon5majeur/core/routes/routes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../widgets/hover_effect_button.dart';
import 'package:go_router/go_router.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({
    super.key,
    required this.email,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();
  bool isOtpComplete = false;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // AppBar with back button
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Assets.icons.backButton.image(),
          ),
        ),
      ),

      // Body content wrapped with SingleChildScrollView
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),

              // Title
              const Text(
                'Check your email',
                style: TextStyle(
                  fontFamily: 'Raleway',
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
                'We sent a reset link to your Gmail \nEnter the 6 digit code mentioned in the email',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: -0.5,
                  color: Color(0xFFB0B3B8),
                  height: 20 / 14,
                ),
              ),

              const SizedBox(height: 40),

              // OTP input field
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: otpController,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                autoDisposeControllers: false,
                cursorColor: Colors.white,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 45,
                  fieldWidth: 45,
                  borderWidth: 2,
                  activeColor: const Color(0xFF004AAD),
                  selectedColor: const Color(0xFF004AAD),
                  inactiveColor: const Color(0xFFB0B3B8),
                  activeFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  inactiveFillColor: Colors.transparent,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: false,
                onChanged: (value) {
                  setState(() {
                    isOtpComplete = value.length == 6;
                  });
                },
              ),

              const SizedBox(height: 40),

              // Verify button
              HoverEffectButton(
                onTap: () => context.go(RoutePath.passwordReset.addBasePath),
                isActive: isOtpComplete,
                text: "Verify Code",
              ),

              const SizedBox(height: 20),

              // Resend email text
              Center(
                child: GestureDetector(
                  onTap: () {
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: -0.5,
                        height: 20 / 14,
                      ),
                      children: [
                        TextSpan(
                          text: "Haven’t got the email yet? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: "Resend email",
                          style: TextStyle(color: Color(0xFF004AAD)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
