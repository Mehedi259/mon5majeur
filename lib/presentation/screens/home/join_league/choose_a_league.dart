import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../../core/custom_assets/assets.gen.dart';
import '../../../../core/routes/route_path.dart';



class ChooseALeagueScreen extends StatelessWidget {
  const ChooseALeagueScreen({super.key});

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
                    'Choose a league',
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
                    'Pick a league and start playing',
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
                Container(
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
                          'Join a league with a code.',
                          style: TextStyle(
                            color: Color(0xFF6B6E82),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Join with code button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () => context.go(RoutePath.privateLeagueScreen.addBasePath),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD85A2A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Join with code',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Public League Card
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1A1A1A),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: Color(0xFF2C2C2C) /* Stroke */,
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
                          'join freely, no code needed.',
                          style: TextStyle(
                            color: Color(0xFF6B6E82),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // League List
                        _buildLeagueItem(Assets.icons.lion, 'Elite Ballers', '8/10 Teams'),
                        const SizedBox(height: 12),
                        _buildLeagueItem(Assets.icons.cap, 'Elite Ballers', '8/10 Teams'),
                        const SizedBox(height: 12),
                        _buildLeagueItem(Assets.icons.lion, 'Elite Ballers', '8/10 Teams'),
                        const SizedBox(height: 12),
                        _buildLeagueItem(Assets.icons.runningball, 'Elite Ballers', '8/10 Teams'),

                        const SizedBox(height: 24),

                        // Explore all leagues button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () => context.go(RoutePath.publicLeagueScreen.addBasePath),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD85A2A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Explore all leagues',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildLeagueItem(AssetGenImage iconAsset, String name, String teams) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C2A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF2A2D3E),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF252838),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: iconAsset.image(
                  width: 18,
                  height: 18,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(width: 16),

            // League Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    teams,
                    style: const TextStyle(
                      color: Color(0xFF6B6E82),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.1,
                    ),
                  ),
                ],
              ),
            ),

            // User Icon
            SizedBox(
              width: 32,
              height: 32,
              child: Center(
                child: Assets.icons.entry.image(
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}