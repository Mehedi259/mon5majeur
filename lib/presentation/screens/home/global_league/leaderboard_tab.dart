import 'package:flutter/material.dart';

class LeaderboardTab extends StatefulWidget {
  const LeaderboardTab({super.key});

  @override
  State<LeaderboardTab> createState() => _LeaderboardTabState();
}

class _LeaderboardTabState extends State<LeaderboardTab> {
  bool _isWeekly = true;
  int _currentPeriod = 1;

  final List<TeamRanking> _weeklyRankings = List.generate(
    17,
        (index) => TeamRanking(
      rank: index + 1,
      teamName: 'Paris FC',
      points: 300,
      isHighlighted: index < 8,
    ),
  )..add(TeamRanking(rank: 70, teamName: 'Paris FC', points: 300));

  final List<TeamRanking> _monthlyRankings = List.generate(
    13,
        (index) => TeamRanking(
      rank: index + 1,
      teamName: 'Paris FC',
      points: 300,
      isHighlighted: index < 2,
    ),
  )..add(TeamRanking(rank: 99, teamName: 'Paris FC', points: 300));

  @override
  Widget build(BuildContext context) {
    final rankings = _isWeekly ? _weeklyRankings : _monthlyRankings;
    final periodLabel = _isWeekly ? 'Week' : 'Month';
    final rewardText = _isWeekly
        ? 'Top 8 will get a Free bonus Every week'
        : 'Monthly winner will win a Official NBA Jersey 👕';
    final rewardIcon = _isWeekly ? '🎁' : '🔥';

    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          'League Standings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2E),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _isWeekly = true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: _isWeekly ? Colors.orange : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'Weekly',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _isWeekly = false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: !_isWeekly ? Colors.orange : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'Monthly',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.white),
              onPressed: () {
                if (_currentPeriod > 1) {
                  setState(() => _currentPeriod--);
                }
              },
            ),
            Text(
              '$periodLabel $_currentPeriod',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: Colors.white),
              onPressed: () => setState(() => _currentPeriod++),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              rewardIcon,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 8),
            Text(
              rewardText,
              style: TextStyle(
                color: _isWeekly ? Colors.pink.shade300 : Colors.orange,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search Teams by name',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFF2C2C2E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: rankings.length,
            itemBuilder: (context, index) {
              final team = rankings[index];
              return _buildTeamRankingCard(team);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTeamRankingCard(TeamRanking team) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: team.isHighlighted ? Colors.orange : Colors.grey.shade800,
          width: team.isHighlighted ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              '${team.rank}',
              style: TextStyle(
                color: team.rank <= 3 ? Colors.orange : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red.shade900,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.sports_basketball,
                color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              team.teamName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            '${team.points}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'View Details',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ),
          if (team.isHighlighted) ...[
            const SizedBox(width: 8),
            const Text('🎁', style: TextStyle(fontSize: 20)),
          ],
        ],
      ),
    );
  }
}

class TeamRanking {
  final int rank;
  final String teamName;
  final int points;
  final bool isHighlighted;

  TeamRanking({
    required this.rank,
    required this.teamName,
    required this.points,
    this.isHighlighted = false,
  });
}