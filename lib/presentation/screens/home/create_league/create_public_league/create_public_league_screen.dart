import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../core/routes/route_path.dart';

class CreatePublicLeagueScreen extends StatefulWidget {
  const CreatePublicLeagueScreen({super.key});

  @override
  State<CreatePublicLeagueScreen> createState() =>
      _CreatePublicLeagueScreenState();
}

class _CreatePublicLeagueScreenState extends State<CreatePublicLeagueScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  AssetGenImage? _selectedLogo;
  String _selectedBudget = '80 M';
  int _selectedPlayers = 6;
  bool _showLogoSelector = false;

  final List<AssetGenImage> _logoOptions = [
    Assets.icons.logo1,
    Assets.icons.logo2,
    Assets.icons.logo3,
    Assets.icons.logo4,
    Assets.icons.logo5,
    Assets.icons.logo6,
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    return _selectedLogo != null && _nameController.text.isNotEmpty;
  }

  void _createLeague() {
    if (_isFormValid) {
      context.go(RoutePath.createPublicLeagueWaitingRoomScreen.addBasePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Back Button
                        GestureDetector(
                          onTap: () => context.go(RoutePath.createLeagueScreen.addBasePath),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Assets.icons.backButton.image(
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        /// Title
                        const Center(
                          child: Text(
                            'Create Public League',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Basic Info Section
                        Container(
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1A1A1A),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 3,
                                color: Color(0xFF2C2C2C),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.info, color: Color(0xFFD85A2A), size: 20),
                                    SizedBox(width: 8),
                                    Text(
                                      'Basic info',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),

                                // Logo Section
                                const Text(
                                  'League Logo*',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showLogoSelector = true;
                                    });
                                  },
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1A1C2A),
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: const Color(0xFFE8632C),
                                        width: 2,
                                      ),
                                    ),
                                    child: Center(
                                      child: _selectedLogo != null
                                          ? _selectedLogo!.image(
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.contain,
                                      )
                                          : const Icon(
                                        Icons.add,
                                        color: Color(0xFFD85A2A),
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'choose your logo',
                                  style: TextStyle(
                                    color: Color(0xFF6B6E82),
                                    fontSize: 12,
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // League Name
                                const Text(
                                  'League Name*',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  controller: _nameController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Enter your league name',
                                    hintStyle: const TextStyle(
                                      color: Color(0xFF6B6E82),
                                      fontSize: 14,
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFF000000),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF323232),
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF323232),
                                        width: 2,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF323232),
                                        width: 2,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.all(16),
                                  ),
                                  onChanged: (_) => setState(() {}),
                                ),

                                const SizedBox(height: 24),

                                // League Description
                                const Text(
                                  'League Description (Optional)',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  controller: _descriptionController,
                                  maxLines: 4,
                                  maxLength: 150,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Tell people about your league....',
                                    hintStyle: const TextStyle(
                                      color: Color(0xFF6B6E82),
                                      fontSize: 14,
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFF000000),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF323232),
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF323232),
                                        width: 2,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF323232),
                                        width: 2,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.all(16),
                                    counterStyle: const TextStyle(
                                      color: Color(0xFF6B6E82),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Game Setup Section
                        Container(
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1A1A1A),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 3,
                                color: Color(0xFF2C2C2C),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.sports_esports, color: Color(0xFFD85A2A), size: 20),
                                    SizedBox(width: 8),
                                    Text(
                                      'Game setup',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),

                                // Team Budget
                                const Text(
                                  'Team budget*',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _buildBudgetOption('80 M'),
                                    const SizedBox(width: 12),
                                    const Text(
                                      'OR',
                                      style: TextStyle(
                                        color: Color(0xFF6B6E82),
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    _buildBudgetOption('100 M'),
                                  ],
                                ),

                                const SizedBox(height: 12),

                                // Number of Players
                                const Text(
                                  'Number of players*',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    _buildPlayerOption(4),
                                    const SizedBox(width: 12),
                                    _buildPlayerOption(6),
                                    const SizedBox(width: 12),
                                    _buildPlayerOption(8),
                                    const SizedBox(width: 12),
                                    _buildPlayerOption(10),
                                  ],
                                ),

                                const SizedBox(height: 12),

                                // League Format
                                const Text(
                                  'League Format',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD85A2A),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color(0xFF323232),
                                      width: 2,
                                    ),
                                  ),
                                  child: const Text(
                                    'Head to Head',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Rules Reminder Section
                        Container(
                          width: double.infinity,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1A1A1A),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 3,
                                color: Color(0xFF2C2C2C),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.info_outline, color: Color(0xFFD85A2A), size: 20),
                                    SizedBox(width: 8),
                                    Text(
                                      'Rules Reminder',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Text(
                                  '• Once created, the league starts in a Waiting Room until you confirm.',
                                  style: TextStyle(
                                    color: Color(0xFF9B9EAF),
                                    fontSize: 13,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '• League will be deleted if not started within 7 days.',
                                  style: TextStyle(
                                    color: Color(0xFF9B9EAF),
                                    fontSize: 13,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '• Minimum 4 teams required to launch.',
                                  style: TextStyle(
                                    color: Color(0xFF9B9EAF),
                                    fontSize: 13,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '• Creator has full control over league settings.',
                                  style: TextStyle(
                                    color: Color(0xFF9B9EAF),
                                    fontSize: 13,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),

                // Create League Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _isFormValid ? _createLeague : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isFormValid
                            ? const Color(0xFFD85A2A)
                            : const Color(0xFF3A3D4A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            color: Color(0xFF323232),
                            width: 2,
                          ),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Create League',
                        style: TextStyle(
                          color: _isFormValid ? Colors.white : const Color(0xFF6B6E82),
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Logo Selector Dialog
          if (_showLogoSelector)
            GestureDetector(
              onTap: () {
                setState(() {
                  _showLogoSelector = false;
                });
              },
              child: Container(
                color: Colors.black,
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF2A2D3E),
                            Color(0xFF1F2230),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: const Color(0xFFE8632C),
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showLogoSelector = false;
                                  });
                                },
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFDC3545),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: _logoOptions.length,
                            itemBuilder: (context, index) {
                              final logo = _logoOptions[index];
                              final isSelected = logo == _selectedLogo;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedLogo = logo;
                                    _showLogoSelector = false;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1A1C2A),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: isSelected
                                          ? const Color(0xFFD85A2A)
                                          : const Color(0xFF323232),
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: logo.image(
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBudgetOption(String budget) {
    final isSelected = _selectedBudget == budget;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBudget = budget;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD85A2A) : const Color(0xFF1A1C2A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF323232),
            width: 2,
          ),
        ),
        child: Text(
          budget,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF6B6E82),
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerOption(int players) {
    final isSelected = _selectedPlayers == players;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedPlayers = players;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFD85A2A) : const Color(0xFF1A1C2A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF323232),
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              players.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF6B6E82),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}