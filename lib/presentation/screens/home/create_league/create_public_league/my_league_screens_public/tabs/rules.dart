import 'package:flutter/material.dart';

class RulesTab extends StatelessWidget {
  const RulesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'League Rules',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 40),
            Text(
              '📋',
              style: TextStyle(fontSize: 80),
            ),
            SizedBox(height: 40),
            Text(
              'Rules content will be displayed here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}