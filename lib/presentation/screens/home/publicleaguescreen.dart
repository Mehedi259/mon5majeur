import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../core/routes/route_path.dart';

class ExploreLeaguesScreen extends StatefulWidget {
  const ExploreLeaguesScreen({super.key});

  @override
  State<ExploreLeaguesScreen> createState() => _ExploreLeaguesScreenState();
}

class _ExploreLeaguesScreenState extends State<ExploreLeaguesScreen> {
  final TextEditingController _searchController = TextEditingController();
  int? _selectedLeagueIndex;

  final List<LeagueData> _leagues = [
    LeagueData(
      name: 'Elite Ballers',
      icon: '🦁',
      description: 'Play for laughs and enjoyment—no pressure, just friendly competition',
      teams: '8/10 Teams',
      format: 'Head to Head',
      category: 'Fun League',
    ),
    LeagueData(
      name: 'Elite Ballers',
      icon: '🦹',
      teams: '6/10 Teams',
      format: 'Head to Head',
    ),
    LeagueData(
      name: 'Elite Ballers',
      icon: '🐉',
      teams: '9/10 Teams',
      format: 'Head to Head',
    ),
    LeagueData(
      name: 'Elite Ballers',
      icon: '🦁',
      teams: '7/10 Teams',
      format: 'Head to Head',
    ),
    LeagueData(
      name: 'Elite Ballers',
      icon: '🏀',
      teams: '5/10 Teams',
      format: 'Head to Head',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showLeagueDetails(int index) {
    setState(() {
      _selectedLeagueIndex = index;
    });
  }

  void _hideLeagueDetails() {
    setState(() {
      _selectedLeagueIndex = null;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Back Button and Title
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Explore leagues',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Browse and join open leagues that fit your style',
                        style: TextStyle(
                          color: Color(0xFF6B6E82),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),

                      // Search Bar
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF2A2D3E),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Find leagues by name',
                            hintStyle: TextStyle(
                              color: Color(0xFF6B6E82),
                              fontSize: 15,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xFF6B6E82),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // League List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _leagues.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _buildLeagueCard(_leagues[index], index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // League Details Popup
          if (_selectedLeagueIndex != null)
            GestureDetector(
              onTap: _hideLeagueDetails,
              child: Container(
                color: Colors.black,
                child: Center(
                  child: GestureDetector(
                    onTap: () {}, // Prevent closing when tapping the card
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF2A2D3E),
                              Color(0xFF1F2230),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Fun League Badge
                              if (_leagues[_selectedLeagueIndex!].category != null)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF3A3D4A),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text('⚽', style: TextStyle(fontSize: 14)),
                                      const SizedBox(width: 6),
                                      Text(
                                        _leagues[_selectedLeagueIndex!].category!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              const SizedBox(height: 20),

                              // League Icon
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1A1C2A),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    _leagues[_selectedLeagueIndex!].icon,
                                    style: const TextStyle(fontSize: 40),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // League Name
                              Text(
                                _leagues[_selectedLeagueIndex!].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.3,
                                ),
                              ),

                              const SizedBox(height: 12),

                              // Description
                              if (_leagues[_selectedLeagueIndex!].description != null)
                                Text(
                                  _leagues[_selectedLeagueIndex!].description!,
                                  style: const TextStyle(
                                    color: Color(0xFF6B6E82),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.2,
                                    height: 1.4,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                              const SizedBox(height: 24),

                              // Info Badges
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1A1C2A),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        const Text('👥', style: TextStyle(fontSize: 16)),
                                        const SizedBox(width: 6),
                                        Text(
                                          _leagues[_selectedLeagueIndex!].teams,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1A1C2A),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        const Text('🏆', style: TextStyle(fontSize: 16)),
                                        const SizedBox(width: 6),
                                        Text(
                                          _leagues[_selectedLeagueIndex!].format,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 28),

                              // Join Button
                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  onPressed: () => context.go(RoutePath.publicLeagueWaitingRoomScreen.addBasePath),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFD85A2A),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: const Text(
                                    'Join',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLeagueCard(LeagueData league, int index) {
    return GestureDetector(
      onTap: () => _showLeagueDetails(index),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2A2D3E),
              Color(0xFF1F2230),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF3A3D50),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // League Icon
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1C2A),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    league.icon,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // League Name
              Expanded(
                child: Text(
                  league.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ),

              // Arrow Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1C2A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFFD85A2A),
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LeagueData {
  final String name;
  final String icon;
  final String teams;
  final String format;
  final String? description;
  final String? category;

  LeagueData({
    required this.name,
    required this.icon,
    required this.teams,
    required this.format,
    this.description,
    this.category,
  });
}