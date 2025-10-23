import 'package:flutter/material.dart';
import '../../../../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../../../../data/models/player.dart';

class MyTeamTab extends StatefulWidget {
  final List<Player?>? savedPlayers;
  final int? savedJerseyIndex;

  const MyTeamTab({super.key, this.savedPlayers, this.savedJerseyIndex});

  @override
  State<MyTeamTab> createState() => _MyTeamTabState();
}

class _MyTeamTabState extends State<MyTeamTab> {
  late List<Player?> selectedPlayers;
  late int selectedJerseyIndex;

  final List<AssetGenImage> jerseys = [
    Assets.icons.gercy1,
    Assets.icons.gercy2,
    Assets.icons.gercy3,
    Assets.icons.gercy4,
    Assets.icons.gercy5,
  ];

  // Mock points for players
  final Map<String, int> playerPoints = {
    'Nikola Vucevic': 21,
    'Jason Tatum': 12,
    'Lebron James': 22,
    'Donovan Mitchell': 9,
    'Stephen Curry': 19,
  };

  @override
  void initState() {
    super.initState();
    selectedPlayers = widget.savedPlayers ?? List.filled(5, null);
    selectedJerseyIndex = widget.savedJerseyIndex ?? 0;
  }

  int get totalPoints =>
      selectedPlayers.fold(0, (sum, player) {
        if (player != null) {
          return sum + (playerPoints[player.name] ?? 0);
        }
        return sum;
      });

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
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Positioned.fill(
            child: Assets.icons.timer.image(
                height: 33,
                width: 33
            ),
          ),
          const SizedBox(height: 16),
          _buildCourtField(),
          const SizedBox(height: 16),
          _buildTotalPoints(),
          const SizedBox(height: 16)
        ],
      ),
    );
  }

  Widget _buildCourtField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Positioned.fill(
              child: Assets.images.playground.image(
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              right: 20,
              child: _buildBonusButton(),
            ),
            // Player positions matching BuildYourTeamTab layout
            Positioned(
              top: 150,
              left: 40,
              child: _buildPlayerWithPoints(0, 'SF/PF'),
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Center(child: _buildPlayerWithPoints(1, 'C')),
            ),
            Positioned(
              top: 150,
              right: 40,
              child: _buildPlayerWithPoints(2, 'SF/PF'),
            ),
            Positioned(
              top: 320,
              left: 60,
              child: _buildPlayerWithPoints(3, 'PG/SG'),
            ),
            Positioned(
              top: 320,
              right: 60,
              child: _buildPlayerWithPoints(4, 'PG/SG'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerWithPoints(int index, String position) {
    final player = selectedPlayers[index];
    final points = player != null ? (playerPoints[player.name] ?? 0) : 0;

    return Column(
      children: [
        SizedBox(
          width: 114,
          height: 96,
          child: Stack(
            children: [
              // Jersey background
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 114,
                  height: 91,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: jerseys[selectedJerseyIndex].provider(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Points circle
              if (player != null)
                Positioned(
                  left: 22,
                  top: 16,
                  child: Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B1538),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('🦁', style: TextStyle(fontSize: 20)),
                        Text(
                          '$points',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              // Position label background
              Positioned(
                left: 41,
                top: 85,
                child: Container(
                  width: 28,
                  height: 11,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF777777),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 0.50,
                        color: Color(0xFFFFFFFF),
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              // Position label text
              Positioned(
                left: 44,
                top: 86,
                child: SizedBox(
                  width: 22,
                  height: 9,
                  child: Text(
                    position,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (player != null) ...[
          const SizedBox(height: 8),
          Text(
            player.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFFECD56),
              fontSize: 12,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              height: 1.83,
            ),
          ),
          const SizedBox(height: 4),
          Container(
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
              '$points',
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
        ],
      ],
    );
  }

  Widget _buildBonusButton() {
    return Container(
      width: 42,
      height: 42,
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
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30,
            height: 5,
          ),
          Text(
            '+ Bonuses',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPoints() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          '$totalPoints Points',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}