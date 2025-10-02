import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger();

/// ProfileSetupScreen
/// ----------------------------------------------------
/// This screen allows users to complete their profile after sign up.
/// Includes:
/// - Team logo selection
/// - Team name input
/// - Favorite team dropdown
/// - Date of birth picker
/// - Terms & Conditions checkbox with expandable notification options
/// - Save & Continue button
/// - Bottom info text
/// ----------------------------------------------------
class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final TextEditingController _teamNameController = TextEditingController(text: 'Paris FC');

  int _selectedLogoIndex = 0;
  String? _selectedFavoriteTeam = 'Lakers';
  DateTime? _selectedDate = DateTime(2022, 12, 2);
  bool _termsAccepted = true;
  bool _notificationsAccepted = false;
  bool _showNotificationOptions = false;

  final List<String> _teamLogos = ['😈', '🌸', '👽', '🐺', '🚀', '🎭'];
  final List<String> _teams = [
    'Lakers',
    'Boston Celtics',
    'Chicago Bulls',
    'Atlanta Hawks',
    'Miami Heat',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Screen Title
              const Text(
                "Complete your profile",
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 40),

              /// Selected Logo Display
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(color: const Color(0xFFFF6B35), width: 4),
                ),
                child: Center(
                  child: Text(
                    _teamLogos[_selectedLogoIndex],
                    style: const TextStyle(fontSize: 60),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              /// Logo Selection Section
              const Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text('🏆', style: TextStyle(fontSize: 24)),
                    SizedBox(width: 8),
                    Text(
                      'Choose your team logo',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose one of the logos below for your team',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// Logo Options
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _teamLogos.length,
                  itemBuilder: (context, index) {
                    final isSelected = index == _selectedLogoIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedLogoIndex = index;
                        });
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: isSelected
                              ? const LinearGradient(
                            colors: [Color(0xFFFF6B35), Color(0xFFFF8C42)],
                          )
                              : null,
                          color: isSelected ? null : const Color(0xFF1a1a1a),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFFFF6B35)
                                : const Color(0xFF333333),
                            width: isSelected ? 3 : 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _teamLogos[index],
                            style: TextStyle(
                              fontSize: isSelected ? 36 : 32,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              /// Team Name Input
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1a1a1a),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF333333)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.person, color: Color(0xFF004AAD), size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _teamNameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Team name',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// Favorite Team Dropdown
              GestureDetector(
                onTap: () async {
                  final result = await showModalBottomSheet<String>(
                    context: context,
                    backgroundColor: const Color(0xFF1a1a1a),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: _teams.map((team) {
                          return ListTile(
                            title: Text(
                              team,
                              style: const TextStyle(color: Colors.white),
                            ),
                            onTap: () => Navigator.pop(context, team),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                  if (result != null) {
                    setState(() {
                      _selectedFavoriteTeam = result;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1a1a1a),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF333333)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      const Icon(Icons.sports_basketball, color: Color(0xFFFF6B35), size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _selectedFavoriteTeam ?? 'Choose your favourite team',
                          style: TextStyle(
                            color: _selectedFavoriteTeam != null ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// Date of Birth Picker
              GestureDetector(
                onTap: () async {
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate ?? DateTime(2000, 1, 1),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: const ColorScheme.dark(
                            primary: Color(0xFFFF6B35),
                            surface: Color(0xFF1a1a1a),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1a1a1a),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF333333)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, color: Colors.white, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _selectedDate != null
                              ? '${_selectedDate!.day.toString().padLeft(2, '0')}/${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.year}'
                              : 'Date of Birth',
                          style: TextStyle(
                            color: _selectedDate != null ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// Terms & Conditions Checkbox
              GestureDetector(
                onTap: () {
                  setState(() {
                    _termsAccepted = !_termsAccepted;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _termsAccepted ? const Color(0xFFFF6B35) : Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        color: _termsAccepted ? const Color(0xFFFF6B35) : Colors.transparent,
                      ),
                      child: _termsAccepted
                          ? const Icon(Icons.check, color: Colors.white, size: 16)
                          : null,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'I accept the Terms & Conditions',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// Notifications Checkbox with Expandable Options
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _notificationsAccepted = !_notificationsAccepted;
                        if (_notificationsAccepted) {
                          _showNotificationOptions = true;
                        } else {
                          _showNotificationOptions = false;
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _notificationsAccepted ? const Color(0xFFFF6B35) : Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(6),
                            color: _notificationsAccepted ? const Color(0xFFFF6B35) : Colors.transparent,
                          ),
                          child: _notificationsAccepted
                              ? const Icon(Icons.check, color: Colors.white, size: 16)
                              : null,
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'I accept to receive notifications',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Icon(
                          _showNotificationOptions
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),

                  /// Expandable Notification Options
                  if (_showNotificationOptions)
                    Container(
                      margin: const EdgeInsets.only(left: 36, top: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1a1a1a),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF333333)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFF6B35),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Don't forget to make your team",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFF6B35),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'The results are in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 40),

              /// Save & Continue Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    logger.i("Team Name: ${_teamNameController.text}");
                    logger.i("Selected Logo: ${_teamLogos[_selectedLogoIndex]}");
                    logger.i("Favorite Team: $_selectedFavoriteTeam");
                    logger.i("Date of Birth: $_selectedDate");
                    logger.i("Terms Accepted: $_termsAccepted");
                    logger.i("Notifications Accepted: $_notificationsAccepted");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Save & Continue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Bottom Info Text
              const Text(
                'You can update these details directly from your profile page',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _teamNameController.dispose();
    super.dispose();
  }
}