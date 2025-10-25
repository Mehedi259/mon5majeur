import 'package:flutter/material.dart';
import '../../../../../../../../core/custom_assets/assets.gen.dart';
import 'match_results_dialog.dart';

class PlayOffView extends StatelessWidget {
  const PlayOffView({super.key});

  @override
  Widget build(BuildContext context) {
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
        Builder(
          builder: (context) => _buildSeeMatchResultsButton(context),
        ),
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
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildMatchCard(AssetGenImage logo, String teamName, String score, bool isWinner) {
    return SizedBox(
      width: 130,
      height: 43,
      child: Stack(
        children: [
          // Score background (back layer)
          Positioned(
            left: 27,
            top: 0,
            child: Container(
              width: 103,
              height: 43,
              decoration: ShapeDecoration(
                color: const Color(0xFFE8632C),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFF2C2C2C),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          // Main card (front layer)
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 103,
              height: 43,
              decoration: ShapeDecoration(
                color: const Color(0xFF1A1A1A),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: isWinner ? const Color(0xFF3CDF1C) : const Color(0xFFD32F2F),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          // Team name
          Positioned(
            left: 37,
            top: 11,
            child: Text(
              teamName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 1.57,
              ),
            ),
          ),
          // Logo background circle
          Positioned(
            left: 7,
            top: 9,
            child: Container(
              width: 26,
              height: 26,
              decoration: const ShapeDecoration(
                color: Color(0xFF1A1A1A),
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
              ),
            ),
          ),
          // Logo image
          Positioned(
            left: 14.22,
            top: 14.78,
            child: SizedBox(
              width: 13.13,
              height: 14.31,
              child: logo.image(fit: BoxFit.cover),
            ),
          ),
          // Score text
          Positioned(
            left: 110,
            top: 13,
            child: SizedBox(
              width: 9,
              height: 17,
              child: Text(
                score,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Russo One',
                  fontWeight: FontWeight.w400,
                  height: 1.10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSemiFinalMatchCard(AssetGenImage logo, String teamName, String score) {
    return SizedBox(
      width: 130,
      height: 43,
      child: Stack(
        children: [
          // Score background (back layer)
          Positioned(
            left: 27,
            top: 0,
            child: Container(
              width: 103,
              height: 43,
              decoration: ShapeDecoration(
                color: const Color(0xFFE8632C),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFF2C2C2C),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          // Main card (front layer)
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 103,
              height: 43,
              decoration: ShapeDecoration(
                color: const Color(0xFF1A1A1A),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFF2C2C2C),
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ),
          // Team name
          Positioned(
            left: 37,
            top: 11,
            child: Text(
              teamName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 1.57,
              ),
            ),
          ),
          // Logo background circle
          Positioned(
            left: 7,
            top: 9,
            child: Container(
              width: 26,
              height: 26,
              decoration: const ShapeDecoration(
                color: Color(0xFF1A1A1A),
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
              ),
            ),
          ),
          // Logo image
          Positioned(
            left: 14.22,
            top: 14.78,
            child: SizedBox(
              width: 13.13,
              height: 14.31,
              child: logo.image(fit: BoxFit.cover),
            ),
          ),
          // Score text
          Positioned(
            left: 110,
            top: 13,
            child: SizedBox(
              width: 9,
              height: 17,
              child: Text(
                score,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Russo One',
                  fontWeight: FontWeight.w400,
                  height: 1.10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeeMatchResultsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showMatchResultsDialog(context);
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
            fontSize: 12,
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

  _PlayoffMatch(
      this.team1Name,
      this.team1Logo,
      this.score1,
      this.team2Name,
      this.team2Logo,
      this.score2,
      this.team1Won,
      );
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