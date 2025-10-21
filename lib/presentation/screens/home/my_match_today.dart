import 'package:flutter/material.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../widgets/custom_heading.dart';

// Model
class Match {
  final String leagueName;
  final AssetGenImage iconAsset;
  final String team1Name;
  final AssetGenImage team1Icon;
  final String team2Name;
  final AssetGenImage team2Icon;
  final String season;

  Match({
    required this.leagueName,
    required this.iconAsset,
    required this.team1Name,
    required this.team1Icon,
    required this.team2Name,
    required this.team2Icon,
    required this.season,
  });
}

// My Matches Today Screen
class MyMatchesTodayScreen extends StatelessWidget {
  const MyMatchesTodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matches = [
      Match(
        leagueName: 'Elite Ballers',
        iconAsset: Assets.icons.basketBall,
        team1Name: 'Paris FC',
        team1Icon: Assets.icons.logo1,
        team2Name: 'Paris FC',
        team2Icon: Assets.icons.logo2,
        season: 'Regular Season',
      ),
      Match(
        leagueName: 'French rockster',
        iconAsset: Assets.icons.basketBall,
        team1Name: 'Paris FC',
        team1Icon: Assets.icons.logo3,
        team2Name: 'Paris FC',
        team2Icon: Assets.icons.logo4,
        season: 'Regular Season',
      ),
      Match(
        leagueName: 'Elite Ballers',
        iconAsset: Assets.icons.basketBall,
        team1Name: 'Paris FC',
        team1Icon: Assets.icons.logo3,
        team2Name: 'Paris FC',
        team2Icon: Assets.icons.logo2,
        season: 'Regular Season',
      ),
      Match(
        leagueName: 'French rockster',
        iconAsset: Assets.icons.basketBall,
        team1Name: 'Paris FC',
        team1Icon: Assets.icons.logo4,
        team2Name: 'Paris FC',
        team2Icon: Assets.icons.logo6,
        season: 'Regular Season',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Column(
          children: [
            // Header using CustomHeading
            CustomHeading(
              title: 'My matches today',
              iconAsset: Assets.icons.vs,
              routePath: RoutePath.home.addBasePath,
            ),

            const SizedBox(height: 30),

            // Matches List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: MatchCard(match: matches[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Match Card Widget
class MatchCard extends StatelessWidget {
  final Match match;

  const MatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A2D3E), Color(0xFF252838)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // League Header
            Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: match.iconAsset.image(
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  match.leagueName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF462C21),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF462C21),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    match.season,
                    style: const TextStyle(
                      color: Color(0xFFF16C37),
                      fontSize: 6,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Match Info
            Row(
              children: [
                // Team 1
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF3A3D50), Color(0xFF2D2F3E)],
                          ),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: match.team1Icon.image(
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        match.team1Name,
                        style: const TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // VS
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: const Text(
                      'Vs',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                // Team 2
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF3A3D50), Color(0xFF2D2F3E)],
                          ),
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: match.team2Icon.image(
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        match.team2Name,
                        style: const TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}