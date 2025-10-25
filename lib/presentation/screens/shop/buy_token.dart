import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';

class BuyTokenScreen extends StatelessWidget {
  const BuyTokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            /// Custom Header
            Container(
              color: const Color(0xFF1A1A1A),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  /// Back Button and Title Row
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.go(RoutePath.shopScreen.addBasePath),
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: Assets.icons.backButton.image(
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Get more Tokens',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30), // Balance the back button
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// Token Icon
                  Assets.icons.morecoin.image(
                    width: 30.5,
                    height: 15,
                  ),
                ],
              ),
            ),

            /// Body
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    const Text(
                      'Choose a pack and boost your game.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.57,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    /// Rookie Pack
                    _buildTokenPack(
                      iconAsset: Assets.icons.rookle,
                      iconColor: const Color(0xFF7F38E8),
                      title: 'Rookie Pack',
                      tokens: '200 TOKENS',
                      price: '€ 1.99',
                      backgroundColor: const Color(0xFF1A2243),
                      gradientColors: [
                        const Color(0xFF8A35E9),
                        const Color(0xFF5145E5),
                      ],
                    ),
                    const SizedBox(height: 20),

                    /// All Star Pack
                    _buildTokenPack(
                      iconAsset: Assets.icons.allstar,
                      iconColor: const Color(0xFF5A43E6),
                      title: 'All star pack',
                      tokens: '550 TOKENS',
                      price: '€ 4.99',
                      backgroundColor: const Color(0xFF291B49),
                      gradientColors: [
                        const Color(0xFF8A35E9),
                        const Color(0xFF5145E5),
                      ],
                    ),
                    const SizedBox(height: 20),

                    /// MVP Pack
                    _buildTokenPack(
                      iconAsset: Assets.icons.mvp,
                      iconColor: const Color(0xFFDD784E),
                      title: 'MVP Pack',
                      tokens: '1200 TOKENS',
                      price: '€ 9.99',
                      backgroundColor: const Color(0xFF2D1D20),
                      gradientColors: [
                        const Color(0xFFE8632C),
                        const Color(0xFFD58564),
                      ],
                    ),
                    const SizedBox(height: 20),

                    /// Hall of Fame Pack
                    _buildTokenPack(
                      iconAsset: Assets.icons.hall,
                      iconColor: const Color(0xFF4BCF96),
                      title: 'Hall of Fame Pack',
                      tokens: '2500 TOKENS',
                      price: '€ 19.99',
                      backgroundColor: const Color(0xFF123431),
                      gradientColors: [
                        const Color(0xFF2CCA87),
                        const Color(0xFF61D2A0),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTokenPack({
    required AssetGenImage iconAsset,
    required Color iconColor,
    required String title,
    required String tokens,
    required String price,
    required Color backgroundColor,
    required List<Color> gradientColors,
  }) {
    return Container(
      width: 302,
      height: 188,
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Icon + Title
          Row(
            children: [
              Container(
                width: 30,
                height: 27,
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: iconAsset.image(
                    width: 17,
                    height: 17,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 11),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  height: 1.57,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          /// Tokens Amount
          Text(
            tokens,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              height: 1.10,
            ),
          ),
          const SizedBox(height: 22),

          /// Price Button
          Container(
            width: double.infinity,
            height: 43,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.50, 0.00),
                end: const Alignment(0.50, 1.00),
                colors: gradientColors,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                price,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}