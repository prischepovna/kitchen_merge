import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/game_provider.dart';

class ChefHeroWidget extends StatelessWidget {
  const ChefHeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();
    final skin = game.currentChefSkin;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(220),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          // Крупная иконка/персонаж Шефа
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: game.currentTheme.boardColor.withAlpha(100),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.amber, width: 3),
            ),
            alignment: Alignment.center,
            child: Text(
              skin.avatar,
              style: const TextStyle(fontSize: 36),
            ),
          ),
          const SizedBox(width: 14),
          // Информация о шефе и его перке
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      skin.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Ур. ${game.playerLevel}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  skin.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}