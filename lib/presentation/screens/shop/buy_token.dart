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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,

        /// Back Button (Fixed)
        leading: GestureDetector(
          onTap: () => context.go(RoutePath.shopScreen.addBasePath),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Assets.icons.backButton.image(
              fit: BoxFit.contain,
              color: Colors.white,
            ),
          ),
        ),

        /// Title
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Get more Tokens',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B35),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '🎟️',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),

      /// Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Choose a pack and boost your game.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            /// Rookie Pack
            _buildTokenPack(
              icon: '🎯',
              iconColor: const Color(0xFF8B5CF6),
              title: 'Rookie Pack',
              tokens: '200 TOKENS',
              price: '€ 1.99',
              backgroundColor: const Color(0xFF1e1b4b),
              borderColor: const Color(0xFF4c1d95),
              buttonColor: const Color(0xFF8B5CF6),
            ),
            const SizedBox(height: 20),

            /// All Star Pack
            _buildTokenPack(
              icon: '⭐',
              iconColor: const Color(0xFF8B5CF6),
              title: 'All Star Pack',
              tokens: '550 TOKENS',
              price: '€ 4.99',
              backgroundColor: const Color(0xFF1e1b4b),
              borderColor: const Color(0xFF4c1d95),
              buttonColor: const Color(0xFF8B5CF6),
            ),
            const SizedBox(height: 20),

            /// MVP Pack
            _buildTokenPack(
              icon: '🏆',
              iconColor: const Color(0xFFFF6B35),
              title: 'MVP Pack',
              tokens: '1200 TOKENS',
              price: '€ 9.99',
              backgroundColor: const Color(0xFF2d1810),
              borderColor: const Color(0xFF78350f),
              buttonColor: const Color(0xFFFF6B35),
            ),
            const SizedBox(height: 20),

            /// Hall of Fame Pack
            _buildTokenPack(
              icon: '🌟',
              iconColor: const Color(0xFF10b981),
              title: 'Hall of Fame Pack',
              tokens: '2500 TOKENS',
              price: '€ 19.99',
              backgroundColor: const Color(0xFF064e3b),
              borderColor: const Color(0xFF065f46),
              buttonColor: const Color(0xFF10b981),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTokenPack({
    required String icon,
    required Color iconColor,
    required String title,
    required String tokens,
    required String price,
    required Color backgroundColor,
    required Color borderColor,
    required Color buttonColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: borderColor,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Icon + Title
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  icon,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          /// Tokens Amount
          Text(
            tokens,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),

          /// Price Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
