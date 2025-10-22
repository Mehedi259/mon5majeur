import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';

class CreateLeagueScreen extends StatelessWidget {
  const CreateLeagueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Back Button
                GestureDetector(
                  onTap: () => context.go(RoutePath.home.addBasePath),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: Assets.icons.backButton.image(
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// Title
                const Center(
                  child: Text(
                    'Create a League',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 8),

                /// Subtitle
                const Center(
                  child: Text(
                    'Choose the type of league you want to create',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFFB0B3B8),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 20),

                // Private League Card
                GestureDetector(
                  onTap: () => context.go(RoutePath.createPrivateLeagueScreen.addBasePath),
                  child: Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF1A1A1A) ,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 3,
                          color: Color(0xFF2C2C2C) ,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          // Lock Icon
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1C2A),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Assets.icons.lock.image(
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Private League',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            'Play with friends using a code',
                            style: TextStyle(
                              color: Color(0xFF6B6E82),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Public League Card
                GestureDetector(
                  onTap: () => context.go(RoutePath.createPublicLeagueScreen.addBasePath),
                  child: Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF1A1A1A),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFF2C2C2C),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          // Trophy Icon
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1A1C2A),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Assets.icons.basketballtrophee.image(
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Public League',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            'Open for anyone to join',
                            style: TextStyle(
                              color: Color(0xFF6B6E82),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.2,
                            ),
                            textAlign: TextAlign.center,
                          ),

                        ],
                      ),
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