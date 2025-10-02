import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../core/routes/route_path.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selectedLang = "English"; // default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Text(
                "MON5MAJEUR",
                style: TextStyle(
                  color: Colors.orange.shade600,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 40),

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
                  "You can change this later on settings",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
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
                          ? Colors.orange
                          : Colors.grey.shade600,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage('assets/icons/uk.png'),
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
                          ? Colors.orange
                          : Colors.grey.shade600,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage('assets/icons/fr.png'),
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

              const SizedBox(height: 60),

              // Get Started Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () => context.go(RoutePath.welcomeScreen.addBasePath),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
