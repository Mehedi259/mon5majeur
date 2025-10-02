import 'package:flutter/material.dart';

// Models
class League {
  final String name;
  final String iconPath;
  final int rank;
  final int totalRanks;
  final String season;
  final int week;
  final int matchday;
  final String status;

  League({
    required this.name,
    required this.iconPath,
    required this.rank,
    required this.totalRanks,
    required this.season,
    required this.week,
    required this.matchday,
    this.status = 'active',
  });
}

// My Leagues Screen
class MyLeaguesScreen extends StatelessWidget {
  const MyLeaguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leagues = [
      League(
        name: 'French Rockster',
        iconPath: '🏀',
        rank: 4,
        totalRanks: 10,
        season: 'Regular season',
        week: 2,
        matchday: 14,
      ),
      League(
        name: 'Paris Rockster',
        iconPath: '🦓',
        rank: 4,
        totalRanks: 10,
        season: 'Regular season',
        week: 2,
        matchday: 9,
      ),
      League(
        name: 'Oyshiks Rockster',
        iconPath: '🐉',
        rank: 4,
        totalRanks: 10,
        season: 'Regular season',
        week: 2,
        matchday: 21,
      ),
      League(
        name: 'Paris Rockster',
        iconPath: '🦓',
        rank: 4,
        totalRanks: 10,
        season: 'Regular season',
        week: 2,
        matchday: 9,
      ),
      League(
        name: 'Oyshiks Rockster',
        iconPath: '🐉',
        rank: 0,
        totalRanks: 10,
        season: 'Regular season',
        week: 0,
        matchday: 0,
        status: 'waiting',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  const Text(
                    'My leagues',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('🏆', style: TextStyle(fontSize: 20)),
                  const Spacer(),
                  const SizedBox(width: 48),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search your leagues by name',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Leagues List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: leagues.length,
                itemBuilder: (context, index) {
                  return LeagueCard(league: leagues[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}

// League Card Widget
class LeagueCard extends StatelessWidget {
  final League league;

  const LeagueCard({super.key, required this.league});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A3A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // League Icon
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                league.iconPath,
                style: const TextStyle(fontSize: 32),
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
                  league.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.emoji_events,
                      color: Color(0xFFFF6B35),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Rank ${league.rank}/${league.totalRanks}',
                      style: const TextStyle(
                        color: Color(0xFFFF6B35),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('|', style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.sports_basketball,
                      color: Color(0xFFFF6B35),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      league.season,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('|', style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 8),
                    Text(
                      'Week ${league.week}',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Matchday Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: league.status == 'waiting'
                  ? Colors.grey[800]
                  : const Color(0xFFFF6B35),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              league.status == 'waiting'
                  ? 'waiting'
                  : 'Matchday ${league.matchday}',
              style: TextStyle(
                color: league.status == 'waiting' ? Colors.grey : Colors.white,
                fontSize: 12,
                fontWeight: league.status == 'waiting'
                    ? FontWeight.normal
                    : FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Bottom Navigation Bar
class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF2A2A2A),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.emoji_events, 1),
              _buildNavItem(Icons.sports_soccer, 2),
              _buildNavItem(Icons.person, 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isActive = currentIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        color: isActive ? const Color(0xFFFF6B35) : Colors.grey[600],
        size: 28,
      ),
      onPressed: () {},
    );
  }
}
