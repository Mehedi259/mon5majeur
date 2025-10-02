import 'package:flutter/material.dart';

// Model
class Match {
  final String leagueName;
  final String leagueIcon;
  final String team1Name;
  final String team1Icon;
  final String team2Name;
  final String team2Icon;
  final String season;

  Match({
    required this.leagueName,
    required this.leagueIcon,
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
        leagueIcon: '🏀',
        team1Name: 'Paris FC',
        team1Icon: '🐉',
        team2Name: 'Paris FC',
        team2Icon: '💠',
        season: 'Regular Season',
      ),
      Match(
        leagueName: 'French rockster',
        leagueIcon: '🏀',
        team1Name: 'Paris FC',
        team1Icon: '🐉',
        team2Name: 'Paris FC',
        team2Icon: '🦁',
        season: 'Regular Season',
      ),
      Match(
        leagueName: 'Elite Ballers',
        leagueIcon: '🏀',
        team1Name: 'Paris FC',
        team1Icon: '🐉',
        team2Name: 'Paris FC',
        team2Icon: '💠',
        season: 'Regular Season',
      ),
      Match(
        leagueName: 'French rockster',
        leagueIcon: '🏀',
        team1Name: 'Paris FC',
        team1Icon: '🐉',
        team2Name: 'Paris FC',
        team2Icon: '🦁',
        season: 'Regular Season',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'My matches today',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text('🏎️', style: TextStyle(fontSize: 22)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

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
            color: Colors.black,
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
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6B35),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      match.leagueIcon,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  match.leagueName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6B35),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFFFF6B35),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    match.season,
                    style: const TextStyle(
                      color: Color(0xFFFFAB8A),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Match Info
            Row(
              children: [
                // Team 1
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF3A3D50), Color(0xFF2D2F3E)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            match.team1Icon,
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        match.team1Name,
                        style: const TextStyle(
                          color: Color(0xFFB8BACA),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F2130),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF3A3D50), width: 1),
                    ),
                    child: const Text(
                      'Vs',
                      style: TextStyle(
                        color: Color(0xFF6B6E82),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
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
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF3A3D50), Color(0xFF2D2F3E)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            match.team2Icon,
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        match.team2Name,
                        style: const TextStyle(
                          color: Color(0xFFB8BACA),
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
