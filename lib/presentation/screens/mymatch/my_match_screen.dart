import 'package:flutter/material.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../widgets/navigation.dart';

class MyMatchScreen extends StatefulWidget {
  const MyMatchScreen({super.key});

  @override
  State<MyMatchScreen> createState() => _MyMatchScreenState();
}

class _MyMatchScreenState extends State<MyMatchScreen> {
  bool _isNbaResultsExpanded = true;
  bool _isFantasyPlayersExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Todays Nba Results',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Todays NBA Results Section
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1a1a1a),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF333333)),
              ),
              child: Column(
                children: [
                  /// Header
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isNbaResultsExpanded = !_isNbaResultsExpanded;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Assets.icons.basketBall.image(width: 29, height: 29),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Todays Nba Results',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            _isNbaResultsExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Expandable Content
                  if (_isNbaResultsExpanded)
                    Column(
                      children: [
                        _buildMatchResult('Lakers', 103, 'Suns', 100),
                        _buildMatchResult('Lakers', 103, 'Suns', 100),
                        _buildMatchResult('Lakers', 103, 'Suns', 100),
                      ],
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Todays Fantasy Players Score Section
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1a1a1a),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF333333)),
              ),
              child: Column(
                children: [
                  /// Header
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isFantasyPlayersExpanded = !_isFantasyPlayersExpanded;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Assets.icons.basketBall.image(width: 29, height: 29),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Text(
                              'Todays Fantasy players Score',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            _isFantasyPlayersExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// Expandable Content
                  if (_isFantasyPlayersExpanded)
                    Column(
                      children: [
                        _buildPlayerCard('Lebron James', 'Lakers', 35),
                        _buildPlayerCard('Lebron James', 'Lakers', 20),
                        _buildPlayerCard('Lebron James', 'Lakers', 33),
                        _buildPlayerCard('Lebron James', 'Lakers', 12),
                        _buildPlayerCard('Lebron James', 'Lakers', 14),
                        _buildPlayerCard('Lebron James', 'Lakers', 23),
                        _buildPlayerCard('Lebron James', 'Lakers', 22),
                      ],
                    ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const NavigationWidget(currentIndex: 1),
    );
  }

  Widget _buildMatchResult(String team1, int score1, String team2, int score2) {
    final bool team1Won = score1 > score2;

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0a0a0a),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2a2a2a)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              team1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            score1.toString(),
            style: TextStyle(
              color: team1Won ? Colors.green : Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Vs',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            score2.toString(),
            style: TextStyle(
              color: !team1Won ? Colors.green : Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              team2,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerCard(String playerName, String team, int score) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0a0a0a),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2a2a2a)),
      ),
      child: Row(
        children: [
          /// Player Avatar/Jersey
          Center(
            child : Assets.icons.dress.image(width: 28, height: 42),
          ),
          const SizedBox(width: 12),

          /// Player Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playerName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8632C),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: const Text(
                        'SF',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      team,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Score
          Text(
            score.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}