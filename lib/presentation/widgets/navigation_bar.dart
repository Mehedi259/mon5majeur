import 'package:flutter/material.dart';

import '../../core/custom_assets/assets.gen.dart';


class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Widget _buildNavItem({
    required int index,
    required Widget icon,
    required bool isActive,
    required double top,
    required double left,
    double dotOffsetX = 10,
    bool isCenter = false,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (isCenter)
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF004AAD),
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF004AAD),
                      offset: Offset(0, 0),
                      blurRadius: 0,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Center(child: icon),
              )
            else
              icon,
            if (isActive)
              Positioned(
                top: -12,
                left: isCenter ? 25.5 : dotOffsetX,
                child: Assets.icons.activeDot.image(
                  width: 9.12,
                  height: 9.12,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      bottom: true,
      child: Container(
        color: const Color(0xFF1C1C1E),
        padding: const EdgeInsets.only(bottom: 8),
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _buildNavItem(
                index: 0,
                icon: currentIndex == 0
                    ? Assets.icons.activeHome.image(width: 30, height: 30)
                    : Assets.icons.inActiveHome.image(width: 30, height: 30),
                isActive: currentIndex == 0,
                top: 30,
                left: width * 0.07,
              ),
              _buildNavItem(
                index: 1,
                icon: currentIndex == 1
                    ? Assets.icons.activeLike.image(width: 30, height: 30)
                    : Assets.icons.inActiveLike.image(width: 30, height: 30),
                isActive: currentIndex == 1,
                top: 30,
                left: width * 0.27,
              ),
              _buildNavItem(
                index: 2,
                icon: Assets.icons.inActiveAddVideo.image(width: 20, height: 20),
                isActive: currentIndex == 2,
                top: -20,
                left: width * 0.5 - 30,
                isCenter: true,
              ),
              _buildNavItem(
                index: 3,
                icon: currentIndex == 3
                    ? Assets.icons.activeWinner.image(width: 30, height: 30)
                    : Assets.icons.inActiveAddWinner.image(width: 30, height: 30),
                isActive: currentIndex == 3,
                top: 30,
                left: width * 0.68,
              ),
              _buildNavItem(
                index: 4,
                icon: currentIndex == 4
                    ? Assets.icons.activeProfile.image(width: 30, height: 30)
                    : Assets.icons.inActiveProfile.image(width: 30, height: 30),
                isActive: currentIndex == 4,
                top: 30,
                left: width * 0.88,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
