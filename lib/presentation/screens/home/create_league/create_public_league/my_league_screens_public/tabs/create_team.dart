import 'package:flutter/material.dart';

import '../../../../../../../data/models/player.dart';
import '../select_player_screen.dart';


class BuildYourTeamTab extends StatefulWidget {
  const BuildYourTeamTab({super.key});

  @override
  State<BuildYourTeamTab> createState() => _BuildYourTeamTabState();
}

class _BuildYourTeamTabState extends State<BuildYourTeamTab> {
  final double totalBudget = 100.0;
  List<Player?> selectedPlayers = List.filled(7, null);

  final List<Player> availablePlayers = [
    Player(name: 'Lebron James', position: 'SF', team: 'Lakers', price: 26.0),
    Player(name: 'Stephen Curry', position: 'PG/SG', team: 'Warriors', price: 27.0),
    Player(name: 'Jason Tatum', position: 'SF/PF', team: 'Celtics', price: 28.0),
    Player(name: 'Nikola Vucevic', position: 'C', team: 'Bulls', price: 18.0),
    Player(name: 'Donovan Mitchell', position: 'PG/SG', team: 'Cavaliers', price: 29.0),
  ];

  double get usedBudget =>
      selectedPlayers.fold(0.0, (sum, p) => sum + (p?.price ?? 0.0));
  int get remainingPlayers => selectedPlayers.where((p) => p == null).length;
  bool get isTeamComplete => selectedPlayers.every((p) => p != null);

  void _selectPlayer(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => SelectPlayerScreen(
          players: availablePlayers,
          remainingBudget: totalBudget - usedBudget,
          onPlayerSelected: (p) => setState(() => selectedPlayers[index] = p),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Build your team',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          _buildMatchdaySelector(),
          const SizedBox(height: 16),
          _buildBudgetCard(),
          const SizedBox(height: 20),
          _buildCourtField(),
          const SizedBox(height: 16),
          _buildTeamStatus(),
          const SizedBox(height: 24),
          _buildTodaysGames(),
          const SizedBox(height: 16),
          _buildTimeLeft(),
          const SizedBox(height: 100),
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
          icon: const Icon(Icons.chevron_left, color: Colors.white),
        ),
        const Text(
          'Matchday 1',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_right, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildBudgetCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1C2A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Budget Used',
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
                Text(
                  '\$${usedBudget.toInt()} M / ${totalBudget.toInt()} M',
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
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: usedBudget / totalBudget,
                backgroundColor: const Color(0xFF2A2D3E),
                valueColor:
                const AlwaysStoppedAnimation<Color>(Color(0xFFFF8C42)),
                minHeight: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourtField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          Positioned(
            top: 50,
            left: 20,
            child: _buildPlayerSlot(0, 'Change Jersey', small: true),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: _buildBonusButton(),
          ),
          Positioned(
            top: 150,
            left: 40,
            child: _buildPlayerSlot(1, 'SF/PF'),
          ),
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Center(child: _buildPlayerSlot(2, 'C')),
          ),
          Positioned(
            top: 150,
            right: 40,
            child: _buildPlayerSlot(3, 'SF/PF'),
          ),
          Positioned(
            top: 320,
            left: 60,
            child: _buildPlayerSlot(4, 'PG/SG'),
          ),
          Positioned(
            top: 320,
            right: 60,
            child: _buildPlayerSlot(5, 'PG/SG'),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(child: _buildPlayerSlot(6, 'PG/SG')),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerSlot(int index, String position, {bool small = false}) {
    final player = selectedPlayers[index];
    final size = small ? 50.0 : 70.0;

    return GestureDetector(
      onTap: () => _selectPlayer(index),
      child: Column(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: player != null
                  ? const Color(0xFF8B1538)
                  : const Color(0xFF2A2D3E),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: player != null
                ? Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('🦁', style: TextStyle(fontSize: 20)),
                      Text(
                        '45',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: small ? 16 : 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 4,
                  left: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      position,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            )
                : const Center(
              child: Icon(Icons.add, color: Colors.white54, size: 30),
            ),
          ),
          if (player != null) ...[
            const SizedBox(height: 8),
            Text(
              player.name,
              style: const TextStyle(
                color: Color(0xFFFFD700),
                fontSize: 13,
                fontWeight: FontWeight.w700,
                shadows: [Shadow(color: Colors.black, blurRadius: 4)],
              ),
            ),
            Text(
              '${player.price.toInt()} M',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                shadows: [Shadow(color: Colors.black, blurRadius: 4)],
              ),
            ),
          ],
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

  Widget _buildTeamStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isTeamComplete
              ? const Color(0xFF4CAF50)
              : const Color(0xFFDC3545),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isTeamComplete
                ? const Color(0xFF4CAF50)
                : const Color(0xFFDC3545),
          ),
        ),
        child: Text(
          isTeamComplete
              ? 'Team Complete'
              : 'You need $remainingPlayers more players.',
          style: TextStyle(
            color: isTeamComplete
                ? const Color(0xFF4CAF50)
                : const Color(0xFFDC3545),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildTodaysGames() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Today's Games",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(child: _buildGameCard('LAL Vs GSW', '8:00 PM')),
              const SizedBox(width: 12),
              Expanded(child: _buildGameCard('BOS Vs MIA', '8:00 PM')),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGameCard(String teams, String time) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C2A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A2D3E)),
      ),
      child: Column(
        children: [
          Text(
            teams,
            style: const TextStyle(
              color: Color(0xFFFF8C42),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeLeft() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.access_time, color: Colors.white70, size: 20),
          SizedBox(width: 8),
          Text(
            '4 Hours Left',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}