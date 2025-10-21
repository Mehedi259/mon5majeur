import 'package:flutter/material.dart';

class MyTeamTab extends StatelessWidget {
  const MyTeamTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'My Team Points for today',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          const Text('⏳', style: TextStyle(fontSize: 50)),
          const SizedBox(height: 20),
          _buildCourtField(),
          const SizedBox(height: 20),
          _buildTotalPoints(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildCourtField() {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=800'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
          ),
          _buildPlayerWithPoints('Nikola Vucevic', '0', 130, null, 0, null),
          _buildPlayerWithPoints('Jason Tatum', '0', 200, 40, null, null),
          _buildPlayerWithPoints('Lebron James', '0', 200, null, null, 40),
          _buildPlayerWithPoints('Donovan Mitchell', '0', 370, 60, null, null),
          _buildPlayerWithPoints('Stephen Curry', '0', 370, null, null, 60),
          Positioned(
            top: 30,
            right: 20,
            child: _buildBonusButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerWithPoints(
      String name, String points, double? top, double? left, double? bottom, double? right) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xFF8B1538),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('🦁', style: TextStyle(fontSize: 20)),
                  Text(
                    '45',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFFFFD700),
              fontSize: 13,
              fontWeight: FontWeight.w700,
              shadows: [Shadow(color: Colors.black, blurRadius: 4)],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              points,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBonusButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, color: Colors.white, size: 20),
          SizedBox(width: 6),
          Text(
            'Bonuses',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPoints() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        '0 Points',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}