import 'package:flutter/material.dart';

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'League Standings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          _buildSeasonBadge(),
          const SizedBox(height: 20),
          _buildTableHeader(),
          const SizedBox(height: 12),
          _buildTeamRow(1, '🦁', 'Paris FC', '3-0', 288, 260, 28, true),
          _buildTeamRow(2, '⚡', 'FC', '2-1', 288, 260, 28, true),
          _buildTeamRow(3, '🏀', 'FC', '1-2', 288, 260, 28, true),
          _buildTeamRow(4, '🏆', 'FC', '1-2', 288, 260, 28, true),
          _buildTeamRow(5, '🦁', 'FC', '1-2', 288, 260, 28, false),
          _buildTeamRow(6, '🎯', 'FC', '3-0', 288, 260, 28, false),
          _buildTeamRow(7, '🦁', 'FC', '3-0', 288, 260, 28, false),
          _buildTeamRow(8, '🦁', 'FC', '3-0', 288, 260, 28, false),
          _buildTeamRow(9, '🦁', 'FC', '3-0', 288, 260, 28, false),
          _buildTeamRow(10, '🦁', 'FC', '3-0', 288, 260, 28, false),
          const SizedBox(height: 20),
          _buildPlayoffInfo(),
        ],
      ),
    );
  }

  Widget _buildSeasonBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'Regular Season',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Team Name',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'W/L',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          Expanded(
            child: Text(
              'PTS',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          Expanded(
            child: Text(
              'PTC',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
          Expanded(
            child: Text(
              '+/-',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamRow(int rank, String emoji, String name, String wl, int pts,
      int ptc, int diff, bool isTopFour) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C2A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isTopFour ? Colors.blue : const Color(0xFF2A2D3E),
          width: isTopFour ? 2 : 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Text(
                  '$rank',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 12),
                Text(emoji, style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 12),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              wl,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: wl.startsWith('3') ? Colors.green : Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '$pts',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '$ptc',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '$diff',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayoffInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue),
      ),
      child: const Row(
        children: [
          Icon(Icons.check_circle, color: Colors.blue, size: 20),
          SizedBox(width: 8),
          Text(
            'Top 4 will qualify for the Playoffs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}