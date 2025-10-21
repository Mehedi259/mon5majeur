import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../core/routes/route_path.dart';
import '../../widgets/active_button.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLang = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Centered Content (Logo + Language options)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      'assets/icons/name_logo.png',
                      width: 154,
                      height: 36,
                    ),
                    const SizedBox(height: 70),

                    // Title
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select Language",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "You can change this later in settings",
                        style:
                        TextStyle(fontSize: 14, color: Color(0xFFB1B1B1)),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // English Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLang = "English";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedLang == "English"
                                ? const Color(0xFFE8632C)
                                : const Color(0xFFB1B1B1),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 14,
                              backgroundImage:
                              AssetImage('assets/icons/uk.png'),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "English",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: selectedLang == "English"
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // French Button
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLang = "French";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedLang == "French"
                                ? const Color(0xFFE8632C)
                                : const Color(0xFFB1B1B1),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 14,
                              backgroundImage:
                              AssetImage('assets/icons/fr.png'),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "French",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: selectedLang == "French"
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// Button fixed at the bottom
              Column(
                children: [
                  ActiveButton(
                    text: 'Get Started',
                    onPressed: () =>
                        context.go(RoutePath.welcomeScreen.addBasePath),
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
