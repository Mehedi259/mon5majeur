import 'package:flutter/material.dart';
import 'tabs/create_team.dart';
import 'tabs/my_team.dart';
import 'tabs/result.dart';
import 'tabs/leaderboard.dart';
import 'tabs/rules.dart';

class FantasyLeagueScreen extends StatefulWidget {
  const FantasyLeagueScreen({super.key});

  @override
  State<FantasyLeagueScreen> createState() => _FantasyLeagueScreenState();
}

class _FantasyLeagueScreenState extends State<FantasyLeagueScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildTabBar(),
            Expanded(
              child: IndexedStack(
                index: _selectedTab,
                children: const [
                  BuildYourTeamTab(),
                  MyTeamTab(),
                  ResultTab(),
                  LeaderboardTab(),
                  RulesTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFFFF8C42),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildLeagueLogo(),
          const SizedBox(height: 12),
          const Text(
            'Elite Ballers',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Public League',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          if (_selectedTab == 0) ...[
            const SizedBox(height: 16),
            _buildBudgetBonus(),
          ],
        ],
      ),
    );
  }

  Widget _buildLeagueLogo() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: const Center(
        child: Text('🦁', style: TextStyle(fontSize: 35)),
      ),
    );
  }

  Widget _buildBudgetBonus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wallet, color: Colors.white, size: 16),
          SizedBox(width: 6),
          Text(
            'Get extra 2M to your budget',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: const Color(0xFF1A1C2A),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTab('Create Team', Icons.add, 0),
          _buildTab('My Team', Icons.group, 1),
          _buildTab('Result', Icons.receipt, 2),
          _buildTab('Leaderboard', Icons.leaderboard, 3),
          _buildTab('Rules', Icons.menu_book, 4),
        ],
      ),
    );
  }

  Widget _buildTab(String label, IconData icon, int index) {
    final isActive = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          children: [
            Icon(
              icon,
              color: isActive ? const Color(0xFFFF8C42) : Colors.white54,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? const Color(0xFFFF8C42) : Colors.white54,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            if (isActive)
              Container(
                width: 40,
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF8C42),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}