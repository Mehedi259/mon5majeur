import 'package:flutter/material.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../widgets/navigation.dart';

// Player Model
class Player {
  final String name;
  final String position;
  final int avg;
  final int price;
  final String team;

  Player({
    required this.name,
    required this.position,
    required this.avg,
    required this.price,
    required this.team,
  });
}

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _showFilterMenu = false;
  String _searchQuery = '';

  // Filter states
  RangeValues _priceRange = const RangeValues(0, 100);
  final Set<String> _selectedPositions = {};
  final Set<String> _selectedTeams = {};
  bool _sortAscending = true; // true = Min to Max, false = Max to Min

  final List<String> _positions = ['SF', 'PG', 'SG', 'C'];
  final List<String> _teams = ['Lakers', 'Suns', 'Warriors', 'Celtics'];

  // Sample player data
  final List<Player> _allPlayers = [
    Player(name: 'Lebron James', position: 'SF', avg: 35, price: 28, team: 'Lakers'),
    Player(name: 'Stephen Curry', position: 'PG', avg: 42, price: 35, team: 'Warriors'),
    Player(name: 'Kevin Durant', position: 'SF', avg: 38, price: 32, team: 'Suns'),
    Player(name: 'Anthony Davis', position: 'C', avg: 30, price: 25, team: 'Lakers'),
    Player(name: 'Jayson Tatum', position: 'SF', avg: 33, price: 29, team: 'Celtics'),
    Player(name: 'Damian Lillard', position: 'PG', avg: 40, price: 30, team: 'Warriors'),
    Player(name: 'Devin Booker', position: 'SG', avg: 36, price: 27, team: 'Suns'),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  List<Player> get _filteredPlayers {
    List<Player> filtered = _allPlayers.where((player) {
      // Search filter
      final matchesSearch = player.name.toLowerCase().contains(_searchQuery);

      // Position filter
      final matchesPosition = _selectedPositions.isEmpty ||
          _selectedPositions.contains(player.position);

      // Team filter
      final matchesTeam = _selectedTeams.isEmpty ||
          _selectedTeams.contains(player.team);

      // Price range filter
      final matchesPrice = player.price >= _priceRange.start &&
          player.price <= _priceRange.end;

      return matchesSearch && matchesPosition && matchesTeam && matchesPrice;
    }).toList();

    // Sort by average score
    filtered.sort((a, b) {
      return _sortAscending
          ? a.avg.compareTo(b.avg)
          : b.avg.compareTo(a.avg);
    });

    return filtered;
  }

  void _clearFilters() {
    setState(() {
      _priceRange = const RangeValues(0, 100);
      _selectedPositions.clear();
      _selectedTeams.clear();
      _sortAscending = true;
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredPlayers = _filteredPlayers;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Data',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              /// Search Bar with Filter Button
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1a1a1a),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF333333)),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(Icons.search, color: Colors.grey, size: 24),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Search players by name',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      if (_searchQuery.isNotEmpty)
                        IconButton(
                          onPressed: () {
                            _searchController.clear();
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _showFilterMenu = !_showFilterMenu;
                          });
                        },
                        icon: Icon(
                          Icons.tune,
                          color: _showFilterMenu ? const Color(0xFFFF6B35) : Colors.white,
                          size: 24,
                        ),
                      ),
                      Icon(
                        _showFilterMenu ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),

              /// Active Filters Display
              if (_selectedPositions.isNotEmpty ||
                  _selectedTeams.isNotEmpty ||
                  _priceRange.start > 0 ||
                  _priceRange.end < 100)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Text(
                        'Filters: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ..._selectedPositions.map((pos) => _buildFilterChip(pos)),
                              ..._selectedTeams.map((team) => _buildFilterChip(team)),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _clearFilters,
                        child: const Text(
                          'Clear All',
                          style: TextStyle(
                            color: Color(0xFFFF6B35),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 8),

              /// Table Header
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Player Name',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Position',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Avg',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Price',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              /// Player List
              Expanded(
                child: filteredPlayers.isEmpty
                    ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.search_off,
                        color: Colors.grey,
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _searchQuery.isNotEmpty
                            ? 'No players found for "$_searchQuery"'
                            : 'No players match your filters',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredPlayers.length,
                  itemBuilder: (context, index) {
                    final player = filteredPlayers[index];
                    return _buildPlayerCard(
                      player.name,
                      player.position,
                      player.avg,
                      '${player.price}M',
                    );
                  },
                ),
              ),
            ],
          ),

          /// Filter Menu Overlay
          if (_showFilterMenu)
            Positioned(
              top: 80,
              right: 16,
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  color: const Color(0xFF1a1a1a),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF333333)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Price Range
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Price Range',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Min ${_priceRange.start.toInt()}M',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'Max ${_priceRange.end.toInt()}M',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: const SliderThemeData(
                              activeTrackColor: Color(0xFFFF6B35),
                              inactiveTrackColor: Color(0xFF333333),
                              thumbColor: Color(0xFFFF6B35),
                              overlayColor: Color(0x33FF6B35),
                              trackHeight: 4,
                            ),
                            child: RangeSlider(
                              values: _priceRange,
                              min: 0,
                              max: 100,
                              onChanged: (values) {
                                setState(() {
                                  _priceRange = values;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(color: Color(0xFF333333), height: 1),

                    /// Avg Point Scored Sorting
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Avg Point Scored',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _sortAscending = true;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      color: _sortAscending
                                          ? const Color(0xFFFF6B35)
                                          : const Color(0xFF2a2a2a),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Min to Max',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: _sortAscending ? Colors.white : Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _sortAscending = false;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                      color: !_sortAscending
                                          ? const Color(0xFFFF6B35)
                                          : const Color(0xFF2a2a2a),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Max to Min',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: !_sortAscending ? Colors.white : Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const Divider(color: Color(0xFF333333), height: 1),

                    /// Position
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Position',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _positions.map((position) {
                              final isSelected = _selectedPositions.contains(position);
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      _selectedPositions.remove(position);
                                    } else {
                                      _selectedPositions.add(position);
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFFFF6B35)
                                        : const Color(0xFF2a2a2a),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    position,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),

                    const Divider(color: Color(0xFF333333), height: 1),

                    /// Team
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Team',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _teams.map((team) {
                              final isSelected = _selectedTeams.contains(team);
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      _selectedTeams.remove(team);
                                    } else {
                                      _selectedTeams.add(team);
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFFFF6B35)
                                        : const Color(0xFF2a2a2a),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    team,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: const NavigationWidget(currentIndex: 2),
    );
  }

  Widget _buildFilterChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFF6B35),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildPlayerCard(String name, String position, int avg, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1a1a),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF333333)),
      ),
      child: Row(
        children: [
          /// Player Avatar/Jersey
          Center(
            child: Assets.icons.dress.image(width: 28, height: 42),
          ),
          const SizedBox(width: 12),

          /// Player Name
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// Position Badge
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B35),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  position,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          /// Average Score with Progress Bar
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  avg.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          /// Price
          Expanded(
            flex: 1,
            child: Text(
              price,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}