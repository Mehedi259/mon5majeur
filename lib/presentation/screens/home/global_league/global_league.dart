import 'package:flutter/material.dart';
import 'create_team_tab.dart';
import 'my_team_tab.dart';
import 'leaderboard_tab.dart';
import 'rules_tab.dart';

class GlobalLeagueScreen extends StatefulWidget {
  const GlobalLeagueScreen({super.key});

  @override
  State<GlobalLeagueScreen> createState() => _GlobalLeagueScreenState();
}

class _GlobalLeagueScreenState extends State<GlobalLeagueScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.green.shade400],
                ),
              ),
              child: const Icon(Icons.public, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 8),
            const Text(
              'Global League',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange.shade700,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.card_giftcard, size: 14, color: Colors.white),
                SizedBox(width: 4),
                Text(
                  'Get extra 10M to your budget\ntwice Every Week',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.orange,
          indicatorWeight: 3,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          labelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(
              icon: Icon(Icons.add_circle_outline, size: 20),
              text: 'Create Team',
            ),
            Tab(
              icon: Icon(Icons.groups_outlined, size: 20),
              text: 'My Team',
            ),
            Tab(
              icon: Icon(Icons.leaderboard_outlined, size: 20),
              text: 'Leaderboard',
            ),
            Tab(
              icon: Icon(Icons.menu_book_outlined, size: 20),
              text: 'Rules',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          CreateTeamTab(),
          MyTeamTab(),
          LeaderboardTab(),
          RulesTab(),
        ],
      ),
    );
  }
}