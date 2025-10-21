import 'package:flutter/material.dart';

class CreateTeamTab extends StatefulWidget {
  const CreateTeamTab({super.key});

  @override
  State<CreateTeamTab> createState() => _CreateTeamTabState();
}

class _CreateTeamTabState extends State<CreateTeamTab> {
  int _matchday = 1;
  double _budgetUsed = 0;
  final double _totalBudget = 100;
  final List<Player?> _selectedPlayers = List.filled(5, null);

  final List<Player> _allPlayers = [
    Player(name: 'LeBron James', position: 'SF/PF', team: 'Lakers', price: 26),
    Player(name: 'Stephen Curry', position: 'PG/SG', team: 'Warriors', price: 27),
    Player(name: 'Nikola Vucevic', position: 'C', team: 'Bulls', price: 18),
    Player(name: 'Jason Tatum', position: 'SF/PF', team: 'Celtics', price: 28),
    Player(name: 'Donovan Mitchell', position: 'PG/SG', team: 'Cavaliers', price: 29),
  ];

  void _selectPlayer(int position) async {
    final player = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayerSelectionScreen(
          remainingBudget: _totalBudget - _budgetUsed,
          players: _allPlayers,
        ),
      ),
    );

    if (player != null && mounted) {
      setState(() {
        _selectedPlayers[position] = player;
        _budgetUsed = _selectedPlayers
            .where((p) => p != null)
            .fold(0, (sum, p) => sum + p!.price);
      });
    }
  }

  void _confirmTeam() {
    if (_selectedPlayers.every((p) => p != null)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => JerseySelectionScreen(
            onJerseySelected: (jersey) {
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final allPlayersFilled = _selectedPlayers.every((p) => p != null);
    final playersNeeded = _selectedPlayers.where((p) => p == null).length;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, color: Colors.white),
                onPressed: () {
                  if (_matchday > 1) setState(() => _matchday--);
                },
              ),
              Text(
                'Matchday $_matchday',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right, color: Colors.white),
                onPressed: () => setState(() => _matchday++),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Budget Used',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      '\$${_budgetUsed.toInt()} M / ${_totalBudget.toInt()} M',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: _budgetUsed / _totalBudget,
                    backgroundColor: Colors.grey.shade800,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _budgetUsed == _totalBudget
                          ? Colors.orange
                          : Colors.orange.shade700,
                    ),
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 420,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=400',
                ),
                fit: BoxFit.cover,
                opacity: 0.3,
              ),
            ),
            child: Stack(
              children: [
                // Substitute player
                Positioned(
                  top: 20,
                  left: 20,
                  child: _buildPlayerCard(null, -1, 'Change Jersey'),
                ),
                // Top forwards
                Positioned(
                  top: 80,
                  left: 40,
                  child: _buildPlayerCard(_selectedPlayers[0], 0, 'SF/PF'),
                ),
                Positioned(
                  top: 80,
                  right: 40,
                  child: _buildPlayerCard(_selectedPlayers[1], 1, 'SF/PF'),
                ),
                // Mid forwards
                Positioned(
                  top: 180,
                  left: 40,
                  child: _buildPlayerCard(_selectedPlayers[2], 2, 'PG/SG'),
                ),
                Positioned(
                  top: 180,
                  right: 40,
                  child: _buildPlayerCard(_selectedPlayers[3], 3, 'PG/SG'),
                ),
                // Center
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: _buildPlayerCard(_selectedPlayers[4], 4, 'C'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (!allPlayersFilled)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade900,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade900),
              ),
              child: Text(
                'You need $playersNeeded more player${playersNeeded > 1 ? 's' : ''}.',
                style: const TextStyle(color: Colors.red, fontSize: 14),
              ),
            )
          else
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.shade700),
              ),
              child: const Text(
                'Team Complete',
                style: TextStyle(color: Colors.green, fontSize: 14),
              ),
            ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Today\'s Games',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildGameCard('LAL Vs GSW', '8:00 PM'),
              ),
              Expanded(
                child: _buildGameCard('BOS Vs MIA', '8:00 PM'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_time, color: Colors.grey, size: 20),
              SizedBox(width: 8),
              Text(
                '4 Hours Left',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: allPlayersFilled ? _confirmTeam : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: allPlayersFilled
                    ? Colors.orange
                    : Colors.grey.shade700,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Confirm My Team',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildPlayerCard(Player? player, int position, String positionLabel) {
    return GestureDetector(
      onTap: position >= 0 ? () => _selectPlayer(position) : null,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.red.shade900,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.red.shade700, width: 2),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    '45',
                    style: TextStyle(
                      color: Colors.red.shade300,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Center(
                  child: Icon(Icons.add_circle_outline,
                      color: Colors.white, size: 24),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              positionLabel,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (player != null) ...[
            const SizedBox(height: 4),
            Text(
              player.name,
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '${player.price} M',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildGameCard(String matchup, String time) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Column(
        children: [
          Text(
            matchup,
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class Player {
  final String name;
  final String position;
  final String team;
  final double price;

  Player({
    required this.name,
    required this.position,
    required this.team,
    required this.price,
  });
}

class PlayerSelectionScreen extends StatelessWidget {
  final double remainingBudget;
  final List<Player> players;

  const PlayerSelectionScreen({
    super.key,
    required this.remainingBudget,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2E),
        title: const Text(
          'Select Player',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Bank \$${remainingBudget.toInt()} M',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search players by name',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF2C2C2E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFF2C2C2E),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Player',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$ Price',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];
                return InkWell(
                  onTap: () => Navigator.pop(context, player),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade900),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.person,
                              color: Colors.grey, size: 30),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                player.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      player.position,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    player.team,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${player.price.toInt()} M',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class JerseySelectionScreen extends StatefulWidget {
  final Function(String) onJerseySelected;

  const JerseySelectionScreen({super.key, required this.onJerseySelected});

  @override
  State<JerseySelectionScreen> createState() => _JerseySelectionScreenState();
}

class _JerseySelectionScreenState extends State<JerseySelectionScreen> {
  String? _selectedJersey;

  final List<JerseyOption> _jerseys = [
    JerseyOption(id: '1', color: Colors.red.shade900, number: '45'),
    JerseyOption(id: '2', color: Colors.blue.shade700, number: '21'),
    JerseyOption(id: '3', color: Colors.green.shade600, number: '57'),
    JerseyOption(id: '4', color: Colors.cyan.shade700, number: '72'),
    JerseyOption(id: '5', color: Colors.purple.shade400, number: '21'),
    JerseyOption(id: '6', color: Colors.indigo.shade600, number: '21'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2E),
        title: const Text(
          'Choose your Jersey',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 32),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemCount: _jerseys.length,
              itemBuilder: (context, index) {
                final jersey = _jerseys[index];
                final isSelected = _selectedJersey == jersey.id;
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedJersey = jersey.id);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.orange
                          : const Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? Colors.orange : Colors.grey.shade800,
                        width: isSelected ? 3 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            color: jersey.color,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              jersey.number,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _selectedJersey != null
                  ? () {
                widget.onJerseySelected(_selectedJersey!);
                Navigator.pop(context);
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedJersey != null
                    ? Colors.orange
                    : Colors.grey.shade700,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JerseyOption {
  final String id;
  final Color color;
  final String number;

  JerseyOption({required this.id, required this.color, required this.number});
}