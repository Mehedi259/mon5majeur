import 'package:flutter/material.dart';
import '../../../../../../../../core/custom_assets/assets.gen.dart';

class RegularSeasonView extends StatelessWidget {
  const RegularSeasonView({super.key});

  @override
  Widget build(BuildContext context) {
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

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
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
}