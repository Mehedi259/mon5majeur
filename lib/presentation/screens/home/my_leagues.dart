import 'package:flutter/material.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../widgets/custom_heading.dart';

// Models
class League {
  final String name;
  final AssetGenImage iconAsset;
  final int rank;
  final int totalRanks;
  final String season;
  final int week;
  final int matchday;
  final String status;

  League({
    required this.name,
    required this.iconAsset,
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
        iconAsset: Assets.icons.logo2,
        rank: 4,
        totalRanks: 10,
        season: 'Regular season',
        week: 2,
        matchday: 14,
      ),
      League(
        name: 'Paris Rockster',
        iconAsset: Assets.icons.logo1,
        rank: 4,
        totalRanks: 10,
        season: 'Regular season',
        week: 2,
        matchday: 9,
      ),
      League(
        name: 'Oyshiks Rockster',
        iconAsset: Assets.icons.logo1,
        rank: 4,
        totalRanks: 10,
        season: 'Regular season',
        week: 2,
        matchday: 21,
      ),
      League(
        name: 'Paris Rockster',
        iconAsset: Assets.icons.logo1,
        rank: 4,
        totalRanks: 10,
        season: 'Regular season',
        week: 2,
        matchday: 9,
      ),
      League(
        name: 'Oyshiks Rockster',
        iconAsset: Assets.icons.logo1,
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
            // Header using CustomHeading
            CustomHeading(
              title: 'My leagues',
              iconAsset: Assets.icons.win,
              routePath: RoutePath.home.addBasePath,
            ),

            const SizedBox(height: 16),

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // League Icon
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2A),
              borderRadius: BorderRadius.circular(33),
            ),
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: league.iconAsset.image(
                  fit: BoxFit.contain,

                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // League Info + Matchday Row
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top Row: League name + Matchday badge
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        league.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
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
                          color: league.status == 'waiting'
                              ? Colors.grey
                              : Colors.white,
                          fontSize: 8,
                          fontWeight: league.status == 'waiting'
                              ? FontWeight.normal
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                /// Rank, Season, Week info
                Row(
                  children: [
                    const Icon(
                      Icons.emoji_events,
                      color: Color(0xFFFF6B35),
                      size: 16,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      'Rank ${league.rank}/${league.totalRanks}',
                      style: const TextStyle(
                        color: Color(0xFFFF6B35),
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text('|', style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.sports_basketball,
                      color: Color(0xFFFF6B35),
                      size: 10,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      league.season,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text('|', style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 4),
                    Text(
                      'Week ${league.week}',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}