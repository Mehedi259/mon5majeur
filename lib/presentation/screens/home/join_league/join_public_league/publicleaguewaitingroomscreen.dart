import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../core/routes/route_path.dart';

class PublicLeagueWaitingRoomScreen extends StatefulWidget {
  const PublicLeagueWaitingRoomScreen({super.key});

  @override
  State<PublicLeagueWaitingRoomScreen> createState() =>
      _PublicLeagueWaitingRoomScreenState();
}

class _PublicLeagueWaitingRoomScreenState
    extends State<PublicLeagueWaitingRoomScreen>
    with SingleTickerProviderStateMixin {
  bool _showLeaveDialog = false;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _showLeaveConfirmation() {
    setState(() {
      _showLeaveDialog = true;
    });
  }

  void _hideLeaveDialog() {
    setState(() {
      _showLeaveDialog = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Back Button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => context.go(RoutePath.publicLeagueScreen.addBasePath),
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Assets.icons.backButton.image(
                            fit: BoxFit.contain,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // League Logo
                    ScaleTransition(
                      scale: _pulseAnimation,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF2A2D3E),
                          border: Border.all(
                            color: const Color(0xFFD85A2A),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Assets.icons.lion.image(
                            width: 56,
                            height: 56,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // League Name
                    const Text(
                      'Elite Ballers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      'Public League',
                      style: TextStyle(
                        color: Color(0xFF6B6E82),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.2,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // League Information Card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0x3535363B),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF2C2C2C),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'League Information',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Details about budget, format, and max teams',
                              style: TextStyle(
                                color: Color(0xFF6B6E82),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildInfoRow(Assets.icons.win, 'Format', 'Head to Head'),
                            const SizedBox(height: 12),
                            _buildInfoRow(Assets.icons.teamgroup, 'Teams', '10'),
                            const SizedBox(height: 12),
                            _buildInfoRow(Assets.icons.moneybag, 'Budget', '100 M'),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Waiting Room Card
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0x3535363B),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF2C2C2C),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              'Waiting Room',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'waiting for more teams',
                              style: TextStyle(
                                color: Color(0xFF6B6E82),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Progress Text
                            const Text(
                              '5/10 Teams joined',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Progress Bar
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const LinearProgressIndicator(
                                value: 5 / 10,
                                minHeight: 8,
                                backgroundColor: Color(0xFF3A3D4A),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF4CAF50),
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            const Text(
                              'The league starts when the creator hits start',
                              style: TextStyle(
                                color: Color(0xFF6B6E82),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 24),

                            // Joined Team Lists Header
                            Row(
                              children: [
                                Assets.icons.teamgroup.image(
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Joined team lists',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 16),

                            // Team List (10 teams for public league)
                            _buildTeamItem(Assets.icons.logo1, 'Thunder Bolts', '#1', false),
                            const SizedBox(height: 8),
                            _buildTeamItem(Assets.icons.logo2, 'Thunder Bolts', '#2', false),
                            const SizedBox(height: 8),
                            _buildTeamItem(Assets.icons.logo3, 'Thunder Bolts', '#3', false),
                            const SizedBox(height: 8),
                            _buildTeamItem(Assets.icons.logo4, 'Thunder Bolts', '#4', false),
                            const SizedBox(height: 8),
                            _buildTeamItem(Assets.icons.logo5, 'Thunder Bolts', '#5', false),
                            const SizedBox(height: 8),
                            _buildTeamItem(Assets.icons.waiting, 'Waiting for players...', '#6', true),
                            const SizedBox(height: 8),
                            _buildTeamItem(Assets.icons.hourglass, 'Waiting for players...', '#7', true),
                            const SizedBox(height: 8),
                            _buildTeamItem(Assets.icons.hourglass, 'Waiting for players...', '#8', true),
                            const SizedBox(height: 8),
                            _buildTeamItem(Assets.icons.hourglass, 'Waiting for players...', '#9', true),
                            const SizedBox(height: 8),
                            _buildTeamItem(Assets.icons.hourglass, 'Waiting for players...', '#10', true),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Leave League Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _showLeaveConfirmation,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDC3545),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Leave league',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),

          // Leave Dialog Overlay
          if (_showLeaveDialog)
            AnimatedOpacity(
              opacity: _showLeaveDialog ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF2A2D3E),
                            Color(0xFF1F2230),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: const Color(0xFF3A3D50),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Are you sure you want to\nleave the league?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.2,
                                height: 1.4,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 32),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 48,
                                    child: OutlinedButton(
                                      onPressed: _hideLeaveDialog,
                                      style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                          color: Color(0xFF3A3D50),
                                          width: 1,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: SizedBox(
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () => context.go(RoutePath.home.addBasePath),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        const Color(0xFFDC3545),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: const Text(
                                        'Leave',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(AssetGenImage iconAsset, String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0x3535363B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF2C2C2C),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0x3535363B),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: const Color(0xFF2C2C2C),
                width: 1,
              ),
            ),
            child: Center(
              child: iconAsset.image(
                width: 18,
                height: 18,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF6B6E82),
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamItem(AssetGenImage iconAsset, String name, String rank, bool isWaiting) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0x3535363B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF2C2C2C),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: const Color(0x3535363B),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: const Color(0xFF2C2C2C),
                width: 1,
              ),
            ),
            child: Center(
              child: iconAsset.image(
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: isWaiting ? const Color(0xFF6B6E82) : Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
                fontStyle: isWaiting ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ),
          Text(
            rank,
            style: TextStyle(
              color: isWaiting ? const Color(0xFF4A4D5A) : const Color(0xFF6B6E82),
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}