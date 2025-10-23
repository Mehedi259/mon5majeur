import 'package:flutter/material.dart';
import '../../../../../../../../core/custom_assets/assets.gen.dart';

class ResultTab extends StatefulWidget {
  const ResultTab({super.key});

  @override
  State<ResultTab> createState() => _ResultTabState();
}

class _ResultTabState extends State<ResultTab> {
  int? expandedCardIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildMatchdaySelector(),
          const SizedBox(height: 16),
          _buildTimer(),
          const SizedBox(height: 16),
          _buildMatchCard(
            0,
            'Paris FC',
            'Kiki FC',
            '0',
            '0',
            true,
            Assets.icons.logo1,
            Assets.icons.logo3,
          ),
          const SizedBox(height: 12),
          _buildMatchCard(
            1,
            'Rock FC',
            'Court FC',
            '0',
            '0',
            false,
            Assets.icons.logo2,
            Assets.icons.logo4,
          ),
          const SizedBox(height: 12),
          _buildMatchCard(
            2,
            'Rock FC',
            'Court FC',
            '0',
            '0',
            false,
            Assets.icons.logo6,
            Assets.icons.logo5,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildMatchdaySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left, color: Color(0xFFB1B1B1)),
        ),
        const Text(
          'Matchday 1',
          style: TextStyle(
            color:  Color(0xFFB1B1B1),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_right, color: Color(0xFFB1B1B1)),
        ),
      ],
    );
  }

  Widget _buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.icons.timer.image(
          width: 33,
          height: 33,
        ),
      ],
    );
  }

  Widget _buildMatchCard(
      int index,
      String team1,
      String team2,
      String score1,
      String score2,
      bool isYou,
      AssetGenImage logo1,
      AssetGenImage logo2,
      ) {
    final bool isExpanded = expandedCardIndex == index;

    return Column(
      children: [
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 362),
          height: 130,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.00, 0.50),
              end: Alignment(1.00, 0.50),
              colors: [Color(0xFF20222B), Color(0xFF14151C)],
            ),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                color: Color(0xFF2C2C2C),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isYou) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildYouBadge(),
                  ),
                  const SizedBox(height: 8),
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Team 1
                    Expanded(
                      child: Row(
                        children: [
                          logo1.image(
                            width: 32,
                            height: 32,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              team1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Score
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            score1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Vs',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            score2,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Team 2
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              team2,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          const SizedBox(width: 8),
                          logo2.image(
                            width: 32,
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildViewDetailsButton(index),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: isExpanded
              ? _buildMatchDetailsField(team1, team2)
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildYouBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: ShapeDecoration(
        color: const Color(0xFF2C2C2C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: const Text(
        'You',
        style: TextStyle(
          color: Colors.white70,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildViewDetailsButton(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (expandedCardIndex == index) {
            expandedCardIndex = null;
          } else {
            expandedCardIndex = index;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.00, 0.50),
            end: Alignment(1.00, 0.50),
            colors: [Color(0xFFE8632C), Color(0xFFFF8A50)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'View Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              expandedCardIndex == index
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchDetailsField(String team1, String team2) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 362),
      height: 700,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Full playground background
            Positioned.fill(
              child: Assets.images.fullplayground.image(
                fit: BoxFit.cover,
              ),
            ),
            // Semi-transparent overlay
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            // Team 1 players (top 5 - red jerseys)
            Positioned(
              top: 140,
              left: 60,
              child: _buildPlayer('Jason Tatum', '0', Assets.icons.gercy1),
            ),
            Positioned(
              top: 140,
              right: 60,
              child: _buildPlayer('Jason Tatum', '0', Assets.icons.gercy1),
            ),
            Positioned(
              top: 60,
              left: 30,
              child: _buildPlayer('Jason Tatum', '0', Assets.icons.gercy1),
            ),
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Center(
                child: _buildPlayer('Jason Tatum', '0', Assets.icons.gercy1),
              ),
            ),
            Positioned(
              top: 60,
              right: 30,
              child: _buildPlayer('Jason Tatum', '0', Assets.icons.gercy1),
            ),
            // Team 2 players (bottom 5 - blue jerseys)
            Positioned(
              bottom: 140,
              left: 60,
              child: _buildPlayer('Jason Tatum', '0', Assets.icons.gercy2),
            ),
            Positioned(
              bottom: 140,
              right: 60,
              child: _buildPlayer('Jason Tatum', '0', Assets.icons.gercy2),
            ),
            Positioned(
              bottom: 60,
              left: 30,
              child: _buildPlayer('Jason Tatum', '0', Assets.icons.gercy2),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Center(
                child: _buildPlayer('Jason Tatum', '0', Assets.icons.gercy2),
              ),
            ),
            Positioned(
              bottom: 60,
              right: 30,
              child: _buildPlayer('Jason Tatum', '0', Assets.icons.gercy2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayer(String name, String points, AssetGenImage jersey) {
    return SizedBox(
      width: 90,
      height: 107,
      child: Stack(
        children: [
          // Jersey image
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 90,
              height: 72,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: jersey.provider(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Player name
          Positioned(
            left: 15,
            top: 66,
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFFECD56),
                fontSize: 10,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                height: 2.20,
              ),
            ),
          ),
          // Points badge
          Positioned(
            left: 35,
            top: 85,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: ShapeDecoration(
                color: const Color(0xFF1A1A1A),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFF2C2C2C),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                points,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w800,
                  height: 1.83,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}