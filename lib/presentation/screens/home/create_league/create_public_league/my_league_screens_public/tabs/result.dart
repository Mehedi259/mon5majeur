import 'package:flutter/material.dart';

class ResultTab extends StatelessWidget {
  const ResultTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildMatchdaySelector(),
          const SizedBox(height: 20),
          const Text('⏳', style: TextStyle(fontSize: 50)),
          const SizedBox(height: 20),
          _buildMatchCard('Paris FC', 'Kiki FC', '0', '0', true),
          const SizedBox(height: 12),
          _buildMatchCard('Rock FC', 'Court FC', '0', '0', false),
          const SizedBox(height: 12),
          _buildMatchCard('Rock FC', 'Court FC', '0', '0', false),
        ],
      ),
    );
  }

  Widget _buildMatchdaySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left, color: Colors.white),
        ),
        const Text(
          'Matchday 1',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_right, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildMatchCard(
      String team1, String team2, String score1, String score2, bool isYou) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C2A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2A2D3E)),
      ),
      child: Column(
        children: [
          if (isYou) _buildYouBadge(),
          const SizedBox(height: 12),
          _buildTeamRow(team1, score1, '🦁', true),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Vs',
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
          ),
          _buildTeamRow(team2, score2, '🏀', false),
          const SizedBox(height: 12),
          _buildViewDetailsButton(),
        ],
      ),
    );
  }

  Widget _buildYouBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'You',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTeamRow(String team, String score, String emoji, bool isLeft) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: isLeft
          ? [
        Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 30)),
            const SizedBox(width: 12),
            Text(
              team,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          score,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ]
          : [
        Text(
          score,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            Text(
              team,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 12),
            Text(emoji, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ],
    );
  }

  Widget _buildViewDetailsButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF8C42),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'View Details',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}