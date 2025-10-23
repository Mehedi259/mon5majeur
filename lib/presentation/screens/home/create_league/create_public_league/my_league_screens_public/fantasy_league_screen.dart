import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';
import 'package:mon5majeur/presentation/screens/home/create_league/create_public_league/my_league_screens_public/tabs/create_team/create_team.dart';
import '../../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../../core/routes/route_path.dart';
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
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.50, 0.00),
          end: Alignment(0.50, 1.00),
          colors: [Color(0xFFE8632C), Color(0xFFFF944D)],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back Button
              GestureDetector(
                onTap: () => context.go(RoutePath.createPublicLeagueWaitingRoomScreen.addBasePath),
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: Assets.icons.backButton.image(
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Center Content (Logo + Text)
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildLeagueLogo(),
                    const SizedBox(height: 4),
                    const Text(
                      'Elite Ballers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Public League',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Placeholder for symmetry
              const SizedBox(width: 30),
            ],
          ),
          if (_selectedTab == 0) ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: _buildBudgetBonus(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLeagueLogo() {
    return Container(
      width: 35,
      height: 36,
      decoration: const ShapeDecoration(
        color: Color(0xFF1A1A1A),
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFB0B0B0),
          ),
        ),
      ),
      child: Center(
        child: Assets.icons.logo1.image(
          width: 16,
          height: 18,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBudgetBonus() {
    return Container(
      height: 23,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.00, 0.50),
          end: Alignment(1.00, 0.50),
          colors: [Color(0xFF2A2A2A), Color(0xFF1F1F1F)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.wallet,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(width: 6),
          Text(
            'Get extra 2M to your budget',
            style: TextStyle(
              color: Colors.white,
              fontSize: 7,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 6),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 8,
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
            const SizedBox(height: 4),
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