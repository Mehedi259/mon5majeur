import 'package:flutter/material.dart';
import '../../../../../../../../core/custom_assets/assets.gen.dart';

class MatchResultsDialog extends StatelessWidget {
  const MatchResultsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dialogWidth = screenWidth * 0.9; // 90% of screen width

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: dialogWidth,
        constraints: const BoxConstraints(maxWidth: 350),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: const Color(0xFF2C2C2C),
            width: 4,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildRoundTitle('Quarter Final Matchday 1'),
                const SizedBox(height: 16),
                _buildMatchRow(
                  isYou: true,
                  team1Logo: Assets.icons.logo1,
                  team1Name: 'Paris FC',
                  team1Score: '102',
                  team2Logo: Assets.icons.logo2,
                  team2Name: 'Paris FC',
                  team2Score: '99',
                  isTeam1Winner: true,
                ),
                const SizedBox(height: 12),
                _buildMatchRow(
                  isYou: true,
                  team1Logo: Assets.icons.logo1,
                  team1Name: 'Paris FC',
                  team1Score: '102',
                  team2Logo: Assets.icons.logo2,
                  team2Name: 'Paris FC',
                  team2Score: '77',
                  isTeam1Winner: true,
                ),
                const SizedBox(height: 16),
                _buildCloseButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoundTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment(-1.0, 0.0),
          end: Alignment(1.0, 0.0),
          colors: [Color(0xFF1E1E1E), Color(0xFF2A2A2A)],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildMatchRow({
    required bool isYou,
    required AssetGenImage team1Logo,
    required String team1Name,
    required String team1Score,
    required AssetGenImage team2Logo,
    required String team2Name,
    required String team2Score,
    required bool isTeam1Winner,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;

        return Container(
          width: cardWidth,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment(-1.0, 0.0),
              end: Alignment(1.0, 0.0),
              colors: [Color(0xFF20222B), Color(0xFF14151C)],
            ),
            border: Border.all(
              color: const Color(0xFF2C2C2C),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "You" label
              if (isYou)
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'You',
                    style: TextStyle(
                      color: Color(0xFFB0B0B0),
                      fontSize: 10,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              // Match details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Team 1
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: const Color(0xFF242424),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF2C2C2C),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: team1Logo.image(width: 12, height: 12),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            team1Name,
                            style: const TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontSize: 10,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          team1Score,
                          style: TextStyle(
                            color: isTeam1Winner
                                ? const Color(0xFF3CDF1C)
                                : const Color(0xFFD32F2F),
                            fontSize: 14,
                            fontFamily: 'Russo One',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // VS
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Vs',
                      style: TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 11,
                        fontFamily: 'Russo One',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  // Team 2
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          team2Score,
                          style: TextStyle(
                            color: !isTeam1Winner
                                ? const Color(0xFF3CDF1C)
                                : const Color(0xFFD32F2F),
                            fontSize: 14,
                            fontFamily: 'Russo One',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            team2Name,
                            style: const TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontSize: 10,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: const Color(0xFF242424),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF2C2C2C),
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: team2Logo.image(width: 12, height: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 120),
        height: 40,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFE8632C), Color(0xFFFF8A50)],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Close',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// Helper function to show the dialog
void showMatchResultsDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => const MatchResultsDialog(),
  );
}