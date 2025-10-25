import 'package:flutter/material.dart';

import '../../../../../../core/custom_assets/assets.gen.dart';
import '../../../../../../data/models/player.dart';

class SelectPlayerScreenpublic extends StatefulWidget {
  final List<Player> players;
  final double remainingBudget;
  final Function(Player) onPlayerSelected;

  const SelectPlayerScreenpublic({
    super.key,
    required this.players,
    required this.remainingBudget,
    required this.onPlayerSelected,
  });

  @override
  State<SelectPlayerScreenpublic> createState() => _SelectPlayerScreenpublicState();
}

class _SelectPlayerScreenpublicState extends State<SelectPlayerScreenpublic> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredPlayers = widget.players.where((player) {
      return player.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildBudgetInfo(),
            _buildSearchBar(),
            _buildTableHeader(),
            const SizedBox(height: 12),
            _buildPlayerList(filteredPlayers),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFFFF8C42),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SizedBox(
              width: 30,
              height: 30,
              child: Assets.icons.backButton.image(
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Expanded(
            child: Text(
              'Select Player',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 28),
        ],
      ),
    );
  }

  Widget _buildBudgetInfo() {
    return Container(
      color: const Color(0xFF000000),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Bank ',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Text(
            '\$${widget.remainingBudget.toInt()} M',
            style: const TextStyle(
              color: Color(0xFF4CAF50),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search players by name',
          hintStyle: const TextStyle(color: Colors.white38),
          prefixIcon: const Icon(Icons.search, color: Colors.white38),
          filled: true,
          fillColor: const Color(0xFF1A1C2A),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2D3E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Player',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '\$ Price',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerList(List<Player> filteredPlayers) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filteredPlayers.length,
        itemBuilder: (context, index) {
          final player = filteredPlayers[index];
          return _buildPlayerCard(player);
        },
      ),
    );
  }

  Widget _buildPlayerCard(Player player) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          widget.onPlayerSelected(player);
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1C2A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              _buildPlayerAvatar(),
              const SizedBox(width: 12),
              Expanded(
                child: _buildPlayerInfo(player),
              ),
              _buildPlayerPrice(player),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerAvatar() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF2A2D3E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Assets.icons.dress.image(
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPlayerInfo(Player player) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          player.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFF8C42),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                player.position,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              player.team,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPlayerPrice(Player player) {
    return Text(
      '${player.price.toInt()} M',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}