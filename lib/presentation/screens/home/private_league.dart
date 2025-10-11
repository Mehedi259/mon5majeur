import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mon5majeur/core/routes/routes.dart';

import '../../../core/routes/route_path.dart';

class PrivateLeagueScreen extends StatefulWidget {
  const PrivateLeagueScreen({super.key});

  @override
  State<PrivateLeagueScreen> createState() => _PrivateLeagueScreenState();
}

class _PrivateLeagueScreenState extends State<PrivateLeagueScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }
  void _clearCode() {
    setState(() {
      _codeController.clear();
      _hasError = false;
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Title
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'Private league',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.3,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Connect with your friend\'s',
                        style: TextStyle(
                          color: Color(0xFF6B6E82),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // Main Card
                Container(
                  width: double.infinity,
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
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        // Lock Icon
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A1C2A),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Text(
                              '🔓',
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        const Text(
                          'Access your league',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          'Enter the code to join Private league',
                          style: TextStyle(
                            color: Color(0xFF6B6E82),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 32),

                        // Code Input Field
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF000000),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _hasError
                                  ? const Color(0xFFD85A2A)
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: TextField(
                            controller: _codeController,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                            ),
                            textAlign: TextAlign.center,
                            maxLength: 6,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.characters,
                            decoration: InputDecoration(
                              hintText: 'Enter 6 digit code',
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.5,
                              ),
                              border: InputBorder.none,
                              counterText: '',
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 18,
                              ),
                              suffixIcon: _codeController.text.isNotEmpty
                                  ? IconButton(
                                icon: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                onPressed: _clearCode,
                              )
                                  : null,
                            ),
                            onChanged: (value) {
                              setState(() {
                                if (_hasError && value.isEmpty) {
                                  _hasError = false;
                                  _errorMessage = '';
                                }
                              });
                            },
                          ),
                        ),

                        // Error Message
                        if (_hasError)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              _errorMessage,
                              style: const TextStyle(
                                color: Color(0xFFFF6B6B),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        else
                          const SizedBox(height: 32),

                        const SizedBox(height: 24),

                        // Join Code Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () => context.go(RoutePath.privateLeagueWaitingRoomScreen.addBasePath),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _codeController.text.isNotEmpty
                                  ? const Color(0xFFD85A2A)
                                  : const Color(0xFF3A3D4A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Join Code',
                              style: TextStyle(
                                color: _codeController.text.isNotEmpty
                                    ? Colors.white
                                    : const Color(0xFF6B6E82),
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ),


                        // Bottom Helper Text (when no error)
                        if (!_hasError)
                          const Padding(
                            padding: EdgeInsets.only(top: 24),
                            child: Text(
                              'Enter a valid code to join your friend\'s league',
                              style: TextStyle(
                                color: Color(0xFF6B6E82),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}