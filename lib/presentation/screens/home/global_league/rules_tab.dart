import 'package:flutter/material.dart';

class RulesTab extends StatelessWidget {
  const RulesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'League Rules',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),
            _buildRuleSection(
              '🏀 Team Building',
              [
                'You have a budget of \$100M to build your team',
                'Select 5 players for your starting lineup',
                'Each player has a different price based on their performance',
                'You can change your team before each matchday deadline',
                'Choose a jersey design to represent your team',
              ],
            ),
            const SizedBox(height: 24),
            _buildRuleSection(
              '📊 Scoring System',
              [
                'Points are awarded based on real NBA player performance',
                'Stats that count: Points, Rebounds, Assists, Steals, Blocks',
                'Bonus points for exceptional performances',
                'Your total score is the sum of all 5 players\' points',
                'Scores update after each game completes',
              ],
            ),
            const SizedBox(height: 24),
            _buildRuleSection(
              '🏆 Weekly & Monthly Prizes',
              [
                'Top 8 teams each week receive bonus budget',
                'Monthly winner receives an official NBA jersey',
                'Rankings reset weekly, but monthly scores accumulate',
                'Tie-breaker: Team with higher budget efficiency wins',
              ],
            ),
            const SizedBox(height: 24),
            _buildRuleSection(
              '⏰ Important Deadlines',
              [
                'Team must be finalized 4 hours before first game',
                'No changes allowed after deadline',
                'Late submissions will not count for that matchday',
                'Check "Today\'s Games" for match schedules',
              ],
            ),
            const SizedBox(height: 24),
            _buildRuleSection(
              '💰 Budget Management',
              [
                'Bonus budget: Get extra 10M twice per week',
                'Budget carries over if not fully used',
                'Player prices may change based on form',
                'Smart budget allocation is key to success',
              ],
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade700, Colors.orange.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.orange,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Icon(Icons.emoji_events, color: Colors.white, size: 48),
                  SizedBox(height: 12),
                  Text(
                    'Good Luck!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'May the best team win the Global League',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildRuleSection(String title, List<String> rules) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.orange,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...rules.map((rule) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  rule,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}