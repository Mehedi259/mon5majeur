import 'package:flutter/material.dart';

class MyTeamTab extends StatefulWidget {
  const MyTeamTab({super.key});

  @override
  State<MyTeamTab> createState() => _MyTeamTabState();
}

class _MyTeamTabState extends State<MyTeamTab> {
  bool _hasResults = false;

  final List<PlayerScore> _players = [
    PlayerScore(name: 'Nikola Vucevic', position: 'SF/PF', points: 21),
    PlayerScore(name: 'Jason Tatum', position: 'SF/PF', points: 12),
    PlayerScore(name: 'Lebron James', position: 'SF/PF', points: 22),
    PlayerScore(name: 'Donovan Mitchell', position: 'PG/SG', points: 9),
    PlayerScore(name: 'Stephen Curry', position: 'PG/SG', points: 19),
  ];

  int get _totalPoints =>
      _players.fold(0, (sum, player) => sum + player.points);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'My Team Points for today',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          if (!_hasResults)
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800,
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Icon(Icons.hourglass_empty,
                                color: Colors.grey, size: 30),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.notifications,
                                    color: Colors.white, size: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Container(
              padding: const EdgeInsets.all(16),
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/3656/3656979.png',
                width: 80,
                height: 80,
                color: Colors.orange,
              ),
            ),
          const SizedBox(height: 8),
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
                if (_hasResults)
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Bonuses',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                // Top forwards
                Positioned(
                  top: 80,
                  left: 40,
                  child: _buildPlayerCard(_players[1]),
                ),
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: _buildPlayerCard(_players[0]),
                  ),
                ),
                Positioned(
                  top: 80,
                  right: 40,
                  child: _buildPlayerCard(_players[2]),
                ),
                // Mid players
                Positioned(
                  bottom: 120,
                  left: 40,
                  child: _buildPlayerCard(_players[3]),
                ),
                Positioned(
                  bottom: 120,
                  right: 40,
                  child: _buildPlayerCard(_players[4]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: _hasResults ? Colors.grey.shade300 : Colors.grey.shade700,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                '$_totalPoints Points',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: _hasResults ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _hasResults = !_hasResults;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text(
              _hasResults ? 'Hide Results' : 'Show Results',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildPlayerCard(PlayerScore player) {
    return Column(
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
            player.position,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
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
        if (_hasResults)
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${player.points}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        else
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              '0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}

class PlayerScore {
  final String name;
  final String position;
  final int points;

  PlayerScore({
    required this.name,
    required this.position,
    required this.points,
  });
}