import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  int? _expandedIndex;

  final List<Map<String, String>> _faqItems = [
    {
      'question': 'What is this game?',
      'answer':
      'My5Major is a free daily fantasy game where you step into the role of coach. Build the best 5-player NBA team within a \$100 million budget. Your players earn points based on their real-life performance, and every day you compete head-to-head against another player in your league',
    },
    {
      'question': 'How are points calculated per player?',
      'answer':
      'Points are calculated based on real NBA statistics including: points scored, rebounds, assists, steals, blocks, and turnovers. Each statistical category has a specific point value that contributes to your player\'s total score.',
    },
    {
      'question': 'Can I play in multiple leagues at the same time?',
      'answer':
      'Yes! You can join and participate in multiple leagues simultaneously. Each league operates independently, so you can compete with different groups of friends or join various public leagues.',
    },
    {
      'question': 'How do I join a private league?',
      'answer':
      'To join a private league, you need an invitation code from the league commissioner. Go to "Join League" section, enter the code provided by your friend or league organizer, and you\'ll be added to the league.',
    },
    {
      'question': 'Can I join a public league?',
      'answer':
      'Absolutely! Public leagues are open to everyone. Simply browse the available public leagues, select one that interests you, and join instantly without needing an invitation code.',
    },
    {
      'question': 'Can I leave a league during the season?',
      'answer':
      'Yes, you can leave a league at any time during the season. However, please note that leaving may affect your standing and you might not be able to rejoin the same league immediately. Consider communicating with your league members before leaving.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 28,
          ),
        ),
        title: const Text(
          'FAQ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _faqItems.length,
          itemBuilder: (context, index) {
            final isExpanded = _expandedIndex == index;
            final item = _faqItems[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1a1a1a),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF333333),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    /// Question Header
                    InkWell(
                      onTap: () {
                        setState(() {
                          _expandedIndex = isExpanded ? null : index;
                        });
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item['question']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Answer Content (Expandable)
                    AnimatedCrossFade(
                      firstChild: const SizedBox.shrink(),
                      secondChild: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Text(
                          item['answer']!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                      ),
                      crossFadeState: isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}