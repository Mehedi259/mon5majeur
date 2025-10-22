import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../core/routes/route_path.dart';

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
      icon: Assets.icons.logo1,
      description: 'Play for laughs and enjoyment—no pressure, just friendly competition',
      teams: '8/10 Teams',
      format: 'Head to Head',
      category: 'Fun League',
    ),
    LeagueData(
      name: 'Elite Ballers',
      icon: Assets.icons.logo2,
      description: 'Play for laughs and enjoyment—no pressure, just friendly competition',
      teams: '6/10 Teams',
      format: 'Head to Head',
      category: 'Fun League',
    ),
    LeagueData(
      name: 'Elite Ballers',
      icon: Assets.icons.logo3,
      description: 'Play for laughs and enjoyment—no pressure, just friendly competition',
      teams: '9/10 Teams',
      format: 'Head to Head',
      category: 'Fun League',
    ),
    LeagueData(
      name: 'Elite Ballers',
      icon: Assets.icons.logo4,
      description: 'Play for laughs and enjoyment—no pressure, just friendly competition',
      teams: '7/10 Teams',
      format: 'Head to Head',
      category: 'Fun League',
    ),
    LeagueData(
      name: 'Elite Ballers',
      icon: Assets.icons.logo5,
      description: 'Play for laughs and enjoyment—no pressure, just friendly competition',
      teams: '5/10 Teams',
      format: 'Head to Head',
      category: 'Fun League',
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
                      // Back Button
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => context.go(RoutePath.chooseALeagueScreen.addBasePath),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Assets.icons.backButton.image(
                              fit: BoxFit.contain,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Title
                      const Text(
                        'Explore league',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 8),

                      // Subtitle
                      const Text(
                        'Browse and join open leagues that fit your style',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFFB0B3B8),
                          height: 1.5,
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
                    onTap: () {},
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
                              // Fun League Badge - Right Aligned
                              if (_leagues[_selectedLeagueIndex!].category != null)
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
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
                                        Assets.icons.logo1.image(
                                          width: 10,
                                          height: 10,
                                          fit: BoxFit.contain,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          _leagues[_selectedLeagueIndex!].category!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              const SizedBox(height: 20),

                              // League Icon
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1A1C2A),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: _leagues[_selectedLeagueIndex!].icon.image(
                                    width: 34,
                                    height: 34,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // League Name
                              Text(
                                _leagues[_selectedLeagueIndex!].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3,
                                ),
                              ),

                              const SizedBox(height: 6),

                              // Description
                              if (_leagues[_selectedLeagueIndex!].description != null)
                                Text(
                                  _leagues[_selectedLeagueIndex!].description!,
                                  style: const TextStyle(
                                    color: Color(0xFF6B6E82),
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.2,
                                    height: 1.4,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                              const SizedBox(height: 14),

                              // Info Badges
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1A1C2A),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        Assets.icons.teamgroup.image(
                                          width: 12,
                                          height: 12,
                                          fit: BoxFit.contain,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          _leagues[_selectedLeagueIndex!].teams,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1A1C2A),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        Assets.icons.win.image(
                                          width: 12,
                                          height: 12,
                                          fit: BoxFit.contain,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          _leagues[_selectedLeagueIndex!].format,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 14),

                              // Join Button
                              SizedBox(
                                width: double.infinity,
                                height: 32,
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
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
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
                  child: league.icon.image(
                    width: 32,
                    height: 32,
                    fit: BoxFit.contain,
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

              // User Icon
              SizedBox(
                width: 32,
                height: 32,
                child: Center(
                  child: Assets.icons.entry.image(
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
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
  final AssetGenImage icon;
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