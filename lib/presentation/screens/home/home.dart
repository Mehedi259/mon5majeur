import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../widgets/navigation.dart';
import 'home_widgets/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      endDrawer: const HomeDrawer(),
      body: Stack(
        children: [
          /// Background Image
          Positioned(
            top: -100,
            left: 0,
            right: 0,
            bottom: 0,
            child: Assets.images.homebg.image(
              fit: BoxFit.cover,
            ),
          ),

          /// Main Content
          SafeArea(
            child: Column(
              children: [
                /// 🔹 Team Logo and Name
                Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFFF6B35), width: 3),
                      ),
                      child: Center(
                        child: Assets.icons.logo1
                            .image(width: 30, height: 30, fit: BoxFit.contain),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Paris FC',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                /// Header Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Earn Tokens Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2a2a2a),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Assets.icons.play.image(width: 16, height: 16),
                            const SizedBox(width: 6),
                            const Text(
                              'Earn 6 free tokens',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            const SizedBox(width: 4),
                            const Text('🎉', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),

                      /// Notification + Menu
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Icon(Icons.notifications,
                                color: Colors.yellow, size: 24),
                          ),
                          const SizedBox(width: 12),
                          Builder(
                            builder: (context) => GestureDetector(
                              onTap: () => Scaffold.of(context).openEndDrawer(),
                              child: const Icon(Icons.menu,
                                  color: Colors.white, size: 28),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// 🔹 Main Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),

                        /// 🔹 NBA Global League Card
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1a1a1a),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFF333333)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'NBA Global League',
                                      style: TextStyle(
                                        color: Color(0xFFE8632C),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Compete against everyone.',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    Text(
                                      'Weekly + Monthly prizes',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => context
                                    .go(RoutePath.globalLeagueScreen.addBasePath),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE8632C),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Join now',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// 🔹 Join/Create League Buttons
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => context.go(
                                    RoutePath.chooseALeagueScreen.addBasePath),
                                child: Container(
                                  height: 140,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1a1a1a),
                                    borderRadius: BorderRadius.circular(16),
                                    border:
                                    Border.all(color: const Color(0xFF333333)),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Join the League',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Icon(Icons.add_circle,
                                          color: Color(0xFFE5E7EB), size: 36),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => context
                                    .go(RoutePath.createLeagueScreen.addBasePath),
                                child: Container(
                                  height: 140,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1a1a1a),
                                    borderRadius: BorderRadius.circular(16),
                                    border:
                                    Border.all(color: const Color(0xFF333333)),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Create a League',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Icon(Icons.add_circle,
                                          color: Color(0xFFE5E7EB), size: 36),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        /// 🔹 My Matches Today
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'My matches today',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        /// Match Card
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1a1a1a),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFF333333)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Assets.icons.basketBall
                                      .image(width: 20, height: 20),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'French rockster',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF2a2a2a),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'Upcoming',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  _teamColumn(Assets.icons.logo1, 'Paris FC'),
                                  const Text(
                                    'Vs',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  _teamColumn(Assets.icons.logo2, 'Hoops FC'),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// See All Matches Button
                        _orangeButton(
                          text: 'See all matches',
                          onPressed: () =>
                              context.go(RoutePath.myMatchToday.addBasePath),
                        ),

                        const SizedBox(height: 30),

                        /// 🔹 My Leagues
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'My Leagues',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        /// League Card
                        GestureDetector(
                          onTap: () => context.go(RoutePath.myLeague.addBasePath),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1a1a1a),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: const Color(0xFF333333)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF2a2a2a),
                                  ),
                                  child: Center(
                                    child: Assets.icons.fireball
                                        .image(width: 20, height: 20),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Assets.icons.basketBall
                                              .image(width: 20, height: 20),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'French rockster',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 16),
                                          ),
                                          const Spacer(),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF2a2a2a),
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                            child: const Text(
                                              'Matchday 14',
                                              style: TextStyle(
                                                  color: Colors.grey, fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 14),
                                      const Row(
                                        children: [
                                          Text(
                                            '🏆 #2nd of 8 teams',
                                            style: TextStyle(
                                                color: Color(0xFFFF6B35),
                                                fontSize: 8),
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            '| Regular season | Week 3',
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 8),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// See All Leagues Button
                        _orangeButton(
                          text: 'See all leagues',
                          onPressed: () =>
                              context.go(RoutePath.myLeague.addBasePath),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      /// 🔹 Bottom Navigation
      bottomNavigationBar: const NavigationWidget(currentIndex: 0),
    );
  }

  /// 🟠 Helper Widget for Team Logo + Name
  static Widget _teamColumn(dynamic logo, String name) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF2a2a2a),
          ),
          child: Center(
            child: logo.image(width: 28.0, height: 28.0, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }

  /// 🟠 Reusable Orange Button
  static Widget _orangeButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B35),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}