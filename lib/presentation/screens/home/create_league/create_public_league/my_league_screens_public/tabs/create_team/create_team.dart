import 'package:flutter/material.dart';
import '../../../../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../../../../data/models/player.dart';
import '../../select_player_screen.dart';
import 'gercy_selection.dart';

class BuildYourTeamTab extends StatefulWidget {
  const BuildYourTeamTab({super.key});

  @override
  State<BuildYourTeamTab> createState() => _BuildYourTeamTabState();
}

class _BuildYourTeamTabState extends State<BuildYourTeamTab> {
  final double totalBudget = 100.0;
  List<Player?> selectedPlayers = List.filled(5, null);
  int selectedJerseyIndex = 0;

  final List<Player> availablePlayers = [
    Player(name: 'Lebron James', position: 'SF/PF', team: 'Lakers', price: 26.0),
    Player(name: 'Stephen Curry', position: 'PG/SG', team: 'Warriors', price: 27.0),
    Player(name: 'Jason Tatum', position: 'SF/PF', team: 'Celtics', price: 28.0),
    Player(name: 'Nikola Vucevic', position: 'C', team: 'Bulls', price: 18.0),
    Player(name: 'Donovan Mitchell', position: 'PG/SG', team: 'Cavaliers', price: 29.0),
  ];

  final List<AssetGenImage> jerseys = [
    Assets.icons.gercy1,
    Assets.icons.gercy2,
    Assets.icons.gercy3,
    Assets.icons.gercy4,
    Assets.icons.gercy5,
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

  void _selectJersey() async {
    final result = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (ctx) => const JerseySelectionScreen(),
      ),
    );
    if (result != null) {
      setState(() {
        selectedJerseyIndex = result;
      });
    }
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
          Container(
            width: 235,
            padding: const EdgeInsets.all(10),
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.00, 0.50),
                end: Alignment(1.00, 0.50),
                colors: [Color(0xFFE8632C), Color(0xFFFF8A50)],
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFF2C2C2C),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Text(
                  'Save My Team',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1.57,
                  ),
                ),
              ],
            ),
          )
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
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Playground background image
            Positioned.fill(
              child: Assets.images.playground.image(
                fit: BoxFit.cover,
              ),
            ),
            // Semi-transparent overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: _buildChangeJerseyButton(),
            ),
            Positioned(
              top: 30,
              right: 20,
              child: _buildBonusButton(),
            ),
            // Index 0 থেকে 4 পর্যন্ত
            Positioned(
              top: 150,
              left: 40,
              child: _buildPlayerSlot(0, 'SF/PF'),
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Center(child: _buildPlayerSlot(1, 'C')),
            ),
            Positioned(
              top: 150,
              right: 40,
              child: _buildPlayerSlot(2, 'SF/PF'),
            ),
            Positioned(
              top: 320,
              left: 60,
              child: _buildPlayerSlot(3, 'PG/SG'),
            ),
            Positioned(
              top: 320,
              right: 60,
              child: _buildPlayerSlot(4, 'PG/SG'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChangeJerseyButton() {
    return GestureDetector(
      onTap: _selectJersey,
      child: SizedBox(
        width: 45,
        height: 55,
        child: Stack(
          children: [
            Positioned(
              left: 4,
              top: 0,
              child: Container(
                width: 36,
                height: 49,
                decoration: ShapeDecoration(
                  color: const Color(0xFF2C2C2C),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFF1A1A1A),
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 45,
                height: 36,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: jerseys[selectedJerseyIndex].provider(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 8,
              top: 27,
              child: Text(
                'Change Jersey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 4,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 5.50,
                ),
              ),
            ),
            const Positioned(
              left: 19,
              top: 33,
              child: Text(
                '+',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w100,
                  height: 2.20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerSlot(int index, String position) {
    final player = selectedPlayers[index];

    return GestureDetector(
      onTap: () => _selectPlayer(index),
      child: Column(
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
                // + icon for empty slots
                if (player == null)
                  const Positioned(
                    left: 48,
                    top: 57,
                    child: SizedBox(
                      width: 17,
                      height: 21,
                      child: Text(
                        '+',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 20,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w300,
                          height: 1.10,
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
                '${player.price.toInt()} M',
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
      ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 5,
          ),
          const Text(
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

  Widget _buildTeamStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 27,
        child: Stack(
          children: [
            // Outer layer
            Positioned(
              left: isTeamComplete ? 4 : 0,
              top: 0,
              right: isTeamComplete ? 7 : 11,
              child: Container(
                height: 27,
                decoration: ShapeDecoration(
                  color: isTeamComplete
                      ? const Color(0xFF5DD344)
                      : const Color(0xFFFF4C4C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            // Inner layer
            Positioned(
              left: isTeamComplete ? 6 : 2,
              top: 0,
              right: isTeamComplete ? 5 : 9,
              child: Container(
                height: 27,
                decoration: ShapeDecoration(
                  color: isTeamComplete
                      ? const Color(0xFF536150)
                      : const Color(0xFF311F1F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            // Text
            Positioned.fill(
              top: 3,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  isTeamComplete
                      ? 'Team Complete'
                      : 'You need $remainingPlayers more players.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isTeamComplete
                        ? const Color(0xFF5DD243)
                        : const Color(0xFFF84A4A),
                    fontSize: 10,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 2.20,
                  ),
                ),
              ),
            ),
          ],
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