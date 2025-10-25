import 'package:flutter/material.dart';
import 'dart:math';
import '../../../core/custom_assets/assets.gen.dart';

class PlayerInfoScreen extends StatelessWidget {
  final String name;
  final String position;
  final int avg;
  final String price;
  final String team;

  const PlayerInfoScreen({
    super.key,
    required this.name,
    required this.position,
    required this.avg,
    required this.price,
    required this.team,
  });

  // Function to get random jersey image
  AssetGenImage _getRandomJersey() {
    final jerseys = [
      Assets.icons.gercy1,
      Assets.icons.gercy2,
      Assets.icons.gercy3,
      Assets.icons.gercy4,
      Assets.icons.gercy5,
    ];
    return jerseys[Random().nextInt(jerseys.length)];
  }

  // Function to get team border color
  Color _getTeamColor() {
    switch (team.toLowerCase()) {
      case 'warriors':
        return const Color(0xFF1D428A); // Warriors blue
      case 'lakers':
        return const Color(0xFFFDB927); // Lakers gold
      case 'celtics':
        return const Color(0xFF007A33); // Celtics green
      case 'suns':
        return const Color(0xFFE56020); // Suns orange
      default:
        return const Color(0xFFFECD56); // Default yellow
    }
  }

  @override
  Widget build(BuildContext context) {
    // Generate random stats for season performance
    final points = (avg + Random().nextInt(20) - 10).toDouble();
    final rebounds = (Random().nextInt(10) + 3).toDouble();
    final assists = (Random().nextInt(8) + 2).toDouble();
    final steals = (Random().nextDouble() * 3).toStringAsFixed(1);
    final turnovers = (Random().nextDouble() * 4 + 1).toStringAsFixed(1);
    final fantasy = (avg * 1.2 + Random().nextInt(10)).toStringAsFixed(1);
    final selectedPercentage = Random().nextInt(100);
    final rating = (avg / 10).toStringAsFixed(1);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header with back button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Assets.icons.backButton.image(
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Player Information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.38,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30), // Balance the back button
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    /// Player Header Section
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Jersey Image
                        _getRandomJersey().image(width: 80, height: 100),
                        const SizedBox(width: 22),

                        /// Player Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.38,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  /// Position Badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE8632C),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Text(
                                      position,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600,
                                        height: 2.75,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),

                                  /// Team Badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1A1A1A),
                                      border: Border.all(
                                        color: _getTeamColor(),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Text(
                                      team,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        height: 2.20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),

                              /// Current Value
                              Row(
                                children: [
                                  const Text(
                                    'Current Value',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      height: 1.83,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    price,
                                    style: const TextStyle(
                                      color: Color(0xFFE8632C),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      height: 1.83,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        /// Active Badge & Rating
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF00FA36),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Active',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 6,
                                  fontWeight: FontWeight.w600,
                                  height: 3.67,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Rating',
                              style: TextStyle(
                                color: Color(0xFFB0B0B0),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.38,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              rating,
                              style: const TextStyle(
                                color: Color(0xFFE8632C),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                height: 0.61,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    /// Season Performance Section
                    Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF3A2216),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Assets.icons.basketballtrophee.image(),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Season Performance',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 1.38,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// Stats Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.92,
                      children: [
                        _buildStatCard(
                          'Points',
                          points.toStringAsFixed(1),
                          const Color(0xFF60A5FA),
                        ),
                        _buildStatCard(
                          'Rebounds',
                          rebounds.toStringAsFixed(1),
                          const Color(0xFF34D399),
                        ),
                        _buildStatCard(
                          'Assists',
                          assists.toStringAsFixed(1),
                          const Color(0xFFC084FC),
                        ),
                        _buildStatCard(
                          'Steals',
                          steals,
                          const Color(0xFFFECD56),
                        ),
                        _buildStatCard(
                          'Turnovers',
                          turnovers,
                          const Color(0xFFF87171),
                        ),
                        _buildStatCard(
                          'Fantasy',
                          fantasy,
                          const Color(0xFFE8632C),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    /// Selected Today Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Selected Today',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.57,
                              ),
                            ),
                            Text(
                              '$selectedPercentage%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.38,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 15,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1A1A),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Stack(
                              children: [
                                FractionallySizedBox(
                                  widthFactor: selectedPercentage / 100,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xFFE8632C),
                                          Color(0xFFFF8A50),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        border: Border.all(
          color: const Color(0xFF2C2C2C),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 0.92,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFB0B0B0),
              fontSize: 10,
              fontWeight: FontWeight.w400,
              height: 1.57,
            ),
          ),
        ],
      ),
    );
  }
}