import 'package:flutter/material.dart';
import 'regular_season.dart';
import 'play_off.dart';

class LeaderboardTab extends StatefulWidget {
  const LeaderboardTab({super.key});

  @override
  State<LeaderboardTab> createState() => _LeaderboardTabState();
}

class _LeaderboardTabState extends State<LeaderboardTab> {
  bool isRegularSeason = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'League Standings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          _buildTabSelector(),
          const SizedBox(height: 12),
          if (isRegularSeason)
            const RegularSeasonView()
          else
            const PlayOffView(),
        ],
      ),
    );
  }

  Widget _buildTabSelector() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isRegularSeason = true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient: isRegularSeason
                      ? const LinearGradient(
                    colors: [Color(0xFF1E1E1E), Color(0xFF2A2A2A)],
                  )
                      : null,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Regular Season',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isRegularSeason ? Colors.white : Colors.white54,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isRegularSeason = false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient: !isRegularSeason
                      ? const LinearGradient(
                    colors: [Color(0xFF1E1E1E), Color(0xFF2A2A2A)],
                  )
                      : null,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Play-Off',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: !isRegularSeason ? Colors.white : Colors.white54,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}