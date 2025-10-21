import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../widgets/navigation.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            /// Header Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Title
                  Text(
                    'Shop',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  /// Placeholder for symmetry
                  SizedBox(width: 28),
                ],
              ),
            ),

            /// Token Balance Header
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1a1a1a),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Bonuses',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2a2a2a),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Assets.icons.tokenIcon.image(
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () => context.go(RoutePath.buyToken.addBasePath),
                          child: const Text(
                            '250 +',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Scrollable Bonus Cards
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  /// Chef Curry Card (Brown/Popular)
                  _BonusCard(
                    backgroundColor: const Color(0xFF3d2f2f),
                    borderColor: const Color(0xFFFF6B35),
                    iconAsset: Assets.icons.chefcurry,
                    title: 'Chef Curry',
                    subtitle: 'Double-Points',
                    description: 'Get +3 to the score from the start',
                    tokenAmount: '130',
                    buttonText: 'Unlock',
                    buttonColor: const Color(0xFFFF6B35),
                    badge: 'Popular',
                    badgeColor: const Color(0xFFFF6B35),
                  ),

                  const SizedBox(height: 16),

                  /// 6th Man Card (Navy Blue)
                  _BonusCard(
                    backgroundColor: const Color(0xFF1a2744),
                    borderColor: const Color(0xFF2d4a7c),
                    iconAsset: Assets.icons.user, // Using user icon as 6thman placeholder
                    title: '6th Man',
                    subtitle: 'Extra Player',
                    description: 'Add one substitute player',
                    tokenAmount: '170',
                    buttonText: 'Unlock',
                    buttonColor: const Color(0xFF8B5CF6),
                  ),

                  const SizedBox(height: 16),

                  /// Luxary Tax Card (Dark Green)
                  _BonusCard(
                    backgroundColor: const Color(0xFF1a3d32),
                    borderColor: const Color(0xFF2d6b54),
                    iconAsset: Assets.icons.win, // Using win icon as luxarytax placeholder
                    title: 'Luxary Tax',
                    subtitle: 'Budget Boost',
                    description: '+5M extra budget to strengthen your team',
                    tokenAmount: '150',
                    buttonText: 'Unlock',
                    buttonColor: const Color(0xFF10B981),
                  ),

                  const SizedBox(height: 16),

                  /// Live Scoring Card (Dark Purple/PRO)
                  _BonusCard(
                    backgroundColor: const Color(0xFF2d2444),
                    borderColor: const Color(0xFF4a3d6b),
                    iconAsset: Assets.icons.livescoring,
                    title: 'Live - Scoring + No Pub',
                    subtitle: 'Real-time update & ADS free',
                    description: 'Follow your players\' live points in real-time during games',
                    tokenAmount: '700',
                    tokenSuffix: '/ Year',
                    buttonText: 'Unlock',
                    buttonColor: const Color(0xFF8B5CF6),
                    badge: 'PRO',
                    badgeColor: const Color(0xFFFF6B35),
                  ),

                  const SizedBox(height: 16),

                  /// Jersey Card (Navy Blue/Coming Soon)
                  _BonusCard(
                    backgroundColor: const Color(0xFF1a2744),
                    borderColor: const Color(0xFF2d4a7c),
                    iconAsset: Assets.icons.dress,
                    title: 'Jersey',
                    subtitle: 'Buy Custom Jerseys',
                    description: 'Coming SOON',
                    tokenAmount: '',
                    buttonText: 'Coming SOON',
                    buttonColor: const Color(0xFF8B5CF6),
                    isComingSoon: true,
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: const NavigationWidget(currentIndex: 3),
    );
  }
}

class _BonusCard extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final AssetGenImage iconAsset;
  final String title;
  final String subtitle;
  final String description;
  final String tokenAmount;
  final String tokenSuffix;
  final String buttonText;
  final Color buttonColor;
  final String? badge;
  final Color? badgeColor;
  final bool isComingSoon;

  const _BonusCard({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconAsset,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tokenAmount,
    this.tokenSuffix = '',
    required this.buttonText,
    required this.buttonColor,
    this.badge,
    this.badgeColor,
    this.isComingSoon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header with Icon, Title, and Badge
          Row(
            children: [
              /// Icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor, width: 2),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: iconAsset.image(
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              /// Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              /// Badge (Popular/PRO)
              if (badge != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badge!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 16),

          /// Description
          Text(
            description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 20),

          /// Token Amount and Unlock Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Token Display
              if (!isComingSoon)
                Row(
                  children: [
                    Assets.icons.tokenIcon.image(
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      tokenAmount,
                      style: const TextStyle(
                        color: Color(0xFFFFD700),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (tokenSuffix.isNotEmpty)
                      Text(
                        ' $tokenSuffix',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      )
                    else
                      const Text(
                        ' Tokens',
                        style: TextStyle(
                          color: Color(0xFFFFD700),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                )
              else
                Assets.icons.tokenIcon.image(
                  width: 24,
                  height: 24,
                ),

              /// Unlock Button
              ElevatedButton(
                onPressed: isComingSoon ? null : () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  disabledBackgroundColor: buttonColor,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}