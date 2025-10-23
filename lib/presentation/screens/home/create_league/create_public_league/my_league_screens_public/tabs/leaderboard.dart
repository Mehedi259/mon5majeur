import 'package:flutter/material.dart';
import '../../../../../../../../core/custom_assets/assets.gen.dart';

class LeaderboardTab extends StatefulWidget {
  const LeaderboardTab({super.key});

  @override
  State<LeaderboardTab> createState() => _LeaderboardTabState();
}

class _LeaderboardTabState extends State<LeaderboardTab> {
  bool isRegularSeason = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'League Standings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          _buildTabSelector(),
          const SizedBox(height: 20),
          if (isRegularSeason) _buildRegularSeasonView() else _buildPlayoffView(),
        ],
      ),
    );
  }

  Widget _buildTabSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isRegularSeason = true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient: isRegularSeason
                      ? const LinearGradient(
                    colors: [Color(0xFF1E1E1E), Color(0xFF2A2A2A)],
                  )
                      : null,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Regular Season',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isRegularSeason ? Colors.white : Colors.white54,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isRegularSeason = false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  gradient: !isRegularSeason
                      ? const LinearGradient(
                    colors: [Color(0xFF1E1E1E), Color(0xFF2A2A2A)],
                  )
                      : null,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Play-Off',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: !isRegularSeason ? Colors.white : Colors.white54,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegularSeasonView() {
    return Column(
      children: [
        _buildTableHeader(),
        const SizedBox(height: 12),
        _buildTeamRow(1, Assets.icons.logo1, 'Paris FC', '3-0', 288, 260, 28, true),
        _buildTeamRow(2, Assets.icons.logo2, 'FC', '2-1', 288, 260, 28, true),
        _buildTeamRow(3, Assets.icons.logo3, 'FC', '1-2', 288, 260, 28, true),
        _buildTeamRow(4, Assets.icons.logo4, 'FC', '1-2', 288, 260, 28, true),
        _buildTeamRow(5, Assets.icons.logo5, 'FC', '1-2', 288, 260, 28, false),
        _buildTeamRow(6, Assets.icons.logo6, 'FC', '3-0', 288, 260, 28, false),
        _buildTeamRow(7, Assets.icons.logo1, 'FC', '3-0', 288, 260, 28, false),
        _buildTeamRow(8, Assets.icons.logo2, 'FC', '3-0', 288, 260, 28, false),
        _buildTeamRow(9, Assets.icons.logo3, 'FC', '3-0', 288, 260, 28, false),
        _buildTeamRow(10, Assets.icons.logo4, 'FC', '3-0', 288, 260, 28, false),
        const SizedBox(height: 20),
        _buildPlayoffInfo(),
      ],
    );
  }

  Widget _buildPlayoffView() {
    return Column(
      children: [
        _buildRoundTitle('Quarter Final Matchday 1'),
        const SizedBox(height: 24),
        _buildPlayoffRound([
          _PlayoffMatch('Paris FC', Assets.icons.logo1, 2, 'Kiki FC', Assets.icons.logo2, 0, true),
          _PlayoffMatch('Lily FC', Assets.icons.logo3, 2, 'Micy FC', Assets.icons.logo4, 0, true),
        ], [
          _SemiFinalTeam('Paris FC', Assets.icons.logo1, 0),
          _SemiFinalTeam('Lily FC', Assets.icons.logo5, 0),
        ]),
        const SizedBox(height: 40),
        _buildRoundTitle('Semi Finals'),
        const SizedBox(height: 24),
        _buildPlayoffRound([
          _PlayoffMatch('Paris FC', Assets.icons.logo1, 2, 'Kiki FC', Assets.icons.logo2, 0, true),
          _PlayoffMatch('Lily FC', Assets.icons.logo3, 2, 'Micy FC', Assets.icons.logo4, 0, true),
        ], [
          _SemiFinalTeam('Paris FC', Assets.icons.logo1, 0),
          _SemiFinalTeam('Lily FC', Assets.icons.logo5, 0),
        ]),
        const SizedBox(height: 32),
        _buildSeeMatchResultsButton(),
      ],
    );
  }

  Widget _buildPlayoffRound(List<_PlayoffMatch> matches, List<_SemiFinalTeam> winners) {
    return Column(
      children: [
        _buildPlayoffMatchRow(matches[0], winners[0]),
        const SizedBox(height: 24),
        _buildPlayoffMatchRow(matches[1], winners[1]),
      ],
    );
  }

  Widget _buildPlayoffMatchRow(_PlayoffMatch match, _SemiFinalTeam winner) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              _buildMatchCard(match.team1Logo, match.team1Name, match.score1.toString(), match.team1Won),
              const SizedBox(height: 12),
              _buildMatchCard(match.team2Logo, match.team2Name, match.score2.toString(), !match.team1Won),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // Bracket connector
        SizedBox(
          width: 40,
          child: CustomPaint(
            size: const Size(40, 90),
            painter: _BracketPainter(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 5,
          child: _buildSemiFinalMatchCard(winner.logo, winner.name, winner.score.toString()),
        ),
      ],
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 3,
            child: Text(
              'Team Name',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'W/L',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
          Expanded(
            child: Text(
              'PTS',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
          Expanded(
            child: Text(
              'PTC',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
          Expanded(
            child: Text(
              '+/-',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamRow(
      int rank,
      AssetGenImage logo,
      String name,
      String wl,
      int pts,
      int ptc,
      int diff,
      bool isTopFour,
      ) {
    final wlParts = wl.split('-');
    final wins = int.parse(wlParts[0]);
    final losses = int.parse(wlParts[1]);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isTopFour ? const Color(0xFF007EF3) : const Color(0xFF2C2C2C),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                SizedBox(
                  width: 12,
                  child: Text(
                    '$rank',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                logo.image(width: 20, height: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$wins',
                    style: const TextStyle(
                      color: Color(0xFF5DD344),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const TextSpan(
                    text: '-',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '$losses',
                    style: const TextStyle(
                      color: Color(0xFFD32F2F),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              '$pts',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF85AFB6),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '$ptc',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFBEBB94),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '$diff',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFA88E53),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayoffInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF007EF3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Top 4 will qualify for the Playoffs',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E1E1E), Color(0xFF2A2A2A)],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildMatchCard(AssetGenImage logo, String teamName, String score, bool isWinner) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isWinner ? const Color(0xFF3CDF1C) : const Color(0xFFD32F2F),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF242424),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF2C2C2C), width: 2),
            ),
            child: Center(child: logo.image(width: 16, height: 16)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              teamName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE8632C), Color(0xFFFF8A50)],
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              score,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Russo One',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSemiFinalMatchCard(AssetGenImage logo, String teamName, String score) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF2C2C2C), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF242424),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF2C2C2C), width: 2),
            ),
            child: Center(child: logo.image(width: 16, height: 16)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              teamName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE8632C), Color(0xFFFF8A50)],
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              score,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Russo One',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeeMatchResultsButton() {
    return GestureDetector(
      onTap: () {
        // Navigate to match results
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFE8632C), Color(0xFFFF8A50)],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'See Match Results',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

// Helper classes for playoff data
class _PlayoffMatch {
  final String team1Name;
  final AssetGenImage team1Logo;
  final int score1;
  final String team2Name;
  final AssetGenImage team2Logo;
  final int score2;
  final bool team1Won;

  _PlayoffMatch(this.team1Name, this.team1Logo, this.score1, this.team2Name, this.team2Logo, this.score2, this.team1Won);
}

class _SemiFinalTeam {
  final String name;
  final AssetGenImage logo;
  final int score;

  _SemiFinalTeam(this.name, this.logo, this.score);
}

// Custom painter for playoff bracket connector
class _BracketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    // Top horizontal line
    path.moveTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.6, size.height * 0.25);

    // Vertical line
    path.moveTo(size.width * 0.6, size.height * 0.25);
    path.lineTo(size.width * 0.6, size.height * 0.75);

    // Bottom horizontal line
    path.moveTo(size.width * 0.6, size.height * 0.75);
    path.lineTo(0, size.height * 0.75);

    // Right horizontal line to winner
    path.moveTo(size.width * 0.6, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}