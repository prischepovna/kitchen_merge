import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/game_provider.dart';
import '../screens/roadmap_screen.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white.withAlpha(230),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoadmapScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber.shade600,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Text('🗺️', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 4),
                  Text(
                    'Ур. ${game.playerLevel}',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              const Text('🪙', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 4),
              Text('${game.coins}', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              const Text('💎', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 4),
              Text('${game.gems}', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              const Text('⚡', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 4),
              Text('${game.energy}/${game.maxEnergy}', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}