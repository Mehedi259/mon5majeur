import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../core/routes/route_path.dart';

class CreatePrivateLeagueWaitingRoomScreen extends StatefulWidget {
  const CreatePrivateLeagueWaitingRoomScreen({super.key});

  @override
  State<CreatePrivateLeagueWaitingRoomScreen> createState() =>
      _CreatePrivateLeagueWaitingRoomScreenState();
}

class _CreatePrivateLeagueWaitingRoomScreenState
    extends State<CreatePrivateLeagueWaitingRoomScreen> {
  final String leagueName = "Goat FC";
  final String leagueCode = "H876A";
  final String format = "Head to Head";
  final int totalTeams = 10;
  final String budget = "100 M";
  final int teamsJoined = 5;
  final int maxTeams = 8;

  final List<Map<String, dynamic>> teams = [
    {'name': 'Thunder Bolts', 'status': 'creator', 'logo': Assets.icons.logo1},
    {'name': 'Thunder Bolts', 'status': 'joined', 'logo': Assets.icons.logo2},
    {'name': 'Thunder Bolts', 'status': 'joined', 'logo': Assets.icons.logo3},
    {'name': 'Thunder Bolts', 'status': 'joined', 'logo': Assets.icons.logo4},
    {'name': 'Thunder Bolts', 'status': 'joined', 'logo': Assets.icons.logo5},
    {
      'name': 'Waiting for players...',
      'status': 'waiting',
      'logo': Assets.icons.waiting
    },
    {
      'name': 'Waiting for players...',
      'status': 'waiting',
      'logo': Assets.icons.hourglass
    },
    {
      'name': 'Waiting for players...',
      'status': 'waiting',
      'logo': Assets.icons.waiting
    },
  ];

  void _copyCode() {
    Clipboard.setData(ClipboardData(text: leagueCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Code copied to clipboard!'),
        backgroundColor: Color(0xFF4CAF50),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1F2230),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Are you sure you want to Delete the league?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          actionsPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xFF9B9EAF),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('League deleted successfully!'),
                    backgroundColor: Color(0xFFDC3545),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC3545),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _kickTeam(int index) {
    if (teams[index]['status'] != 'creator') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${teams[index]['name']} has been kicked'),
          backgroundColor: const Color(0xFFDC3545),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            // Header with Back Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () =>
                        context.go(RoutePath.createLeagueScreen.addBasePath),
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Assets.icons.backButton.image(
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    // League Logo
                    Container(
                      width: 65,
                      height: 66,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFCC5123),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Assets.icons.lion.image(
                          width: 29,
                          height: 33,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 17),

                    // League Name
                    Text(
                      leagueName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                        height: 1.10,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // League Type
                    const Text(
                      'Private League',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFAAAAAA),
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                        height: 1.38,
                      ),
                    ),

                    const SizedBox(height: 29),

                    // League Information Card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.50, 0.00),
                          end: Alignment(0.50, 1.00),
                          colors: [Color(0x8C1C1F26), Color(0x8C0F1116)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF2C2C2C),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            // Header with Creator Badge
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'League Information',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    height: 1.38,
                                  ),
                                ),
                                const SizedBox(width: 60),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1A1A1A),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: const Color(0xFFB0B0B0),
                                      width: 1,
                                    ),
                                  ),
                                  child: const Text(
                                    'Creator',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 2.20,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            const Text(
                              'Custom settings by you',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.83,
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Info Rows
                            _buildInfoRow(
                                Assets.icons.win, 'Format', format),
                            const SizedBox(height: 8),
                            _buildInfoRow(Assets.icons.teamgroup, 'Teams',
                                totalTeams.toString()),
                            const SizedBox(height: 8),
                            _buildInfoRow(
                                Assets.icons.moneybag, 'Budget', budget),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Waiting Room Card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.50, 0.00),
                          end: Alignment(0.50, 1.00),
                          colors: [Color(0x8C1C1F26), Color(0x8C0F1116)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF2C2C2C),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              'Waiting Room',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                height: 1.38,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Waiting for teams to join or for you to start the league',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF777777),
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.83,
                              ),
                            ),
                            const SizedBox(height: 26),
                            Text(
                              '$teamsJoined/$maxTeams Teams joined',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 1.83,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Progress Bar
                            Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2C2C2C),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: teamsJoined / maxTeams,
                                  child: Container(
                                    height: 14,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment(0.00, 0.50),
                                        end: Alignment(1.00, 0.50),
                                        colors: [
                                          Color(0xFF4CAF50),
                                          Color(0xFF66BB6A)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'The league starts when you hit start',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFB0B0B0),
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.83,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Joined Team Lists Card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(0.50, 0.00),
                          end: Alignment(0.50, 1.00),
                          colors: [Color(0x8C1C1F26), Color(0x8C0F1116)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF2C2C2C),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Assets.icons.teamgroup.image(
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Joined team lists',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    height: 1.38,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: teams.length,
                              separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                              itemBuilder: (context, index) {
                                final team = teams[index];
                                return _buildTeamItem(
                                  index + 1,
                                  team['name'],
                                  team['logo'],
                                  team['status'],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Join Code Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Join Code',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A1A1A),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFCC5123),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                leagueCode,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: _copyCode,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 18,
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment(0.50, 0.00),
                                      end: Alignment(0.50, 1.00),
                                      colors: [
                                        Color(0xFFE8632C),
                                        Color(0xFFFF8A50)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color(0xFFCC5123),
                                      width: 1,
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Copy',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Bottom Buttons
                    Column(
                      children: [
                        // Edit League Button
                        SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: OutlinedButton(
                            onPressed: () => context.go(
                                RoutePath.editPrivateLeagueScreen.addBasePath),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xFF1A1A1A),
                              side: const BorderSide(
                                color: Color(0xFF777777),
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Edit League',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 1.69,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Delete League Button
                        SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {
                              _showDeleteConfirmationDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD32F2F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Delete League',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 1.69,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Start League Button
                        SizedBox(
                          width: double.infinity,
                          height: 42,
                          child: ElevatedButton(
                            onPressed: () => context.go(RoutePath.fantasyLeagueScreenPrivate.addBasePath),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment(0.50, 0.00),
                                  end: Alignment(0.50, 1.00),
                                  colors: [
                                    Color(0xFFE8632C),
                                    Color(0xFFFF8A50)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFCC5123),
                                  width: 1,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Start League',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 1.57,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(AssetGenImage icon, String label, String value) {
    return Container(
      width: double.infinity,
      height: 32,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF2C2C2C),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          icon.image(width: 14, height: 14),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 2.20,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              height: 2.20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamItem(
      int index, String name, AssetGenImage logo, String status) {
    final isWaiting = status == 'waiting';
    final isCreator = status == 'creator';

    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0x3535363B),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF2C2C2C),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          SizedBox(
            width: 14,
            child: Text(
              '$index.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFB0B0B0),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 1.38,
              ),
            ),
          ),
          const SizedBox(width: 7),
          Container(
            width: 27,
            height: 26,
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF2C2C2C),
                width: 1,
              ),
            ),
            child: Center(
              child: logo.image(
                width: 14,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isWaiting ? const Color(0xFF777777) : Colors.white,
                fontSize: 13,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                fontStyle: isWaiting ? FontStyle.italic : FontStyle.normal,
                height: 1.69,
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (isCreator)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Text(
                'Creator',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFAAAAAA),
                  fontSize: 11,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
              ),
            )
          else if (!isWaiting)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: const Color(0xFFD32F2F),
                  width: 1,
                ),
              ),
              child: GestureDetector(
                onTap: () => _kickTeam(index - 1),
                child: const Text(
                  'Kick',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFD32F2F),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 2,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}