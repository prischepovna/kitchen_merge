import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/game_provider.dart';
import '../models/board_theme_model.dart';

class RoadmapScreen extends StatelessWidget {
  const RoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('🗺️ Карта Кухонь (1000 Уровней)'),
        backgroundColor: Colors.amber.shade700,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: BoardThemeDatabase.themes.length,
        itemBuilder: (context, index) {
          final theme = BoardThemeDatabase.themes[index];
          bool isUnlocked = game.playerLevel >= theme.unlockLevel;
          bool isCurrent = game.currentTheme.id == theme.id;

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: isCurrent ? 6 : 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: isCurrent ? Colors.amber.shade800 : Colors.transparent,
                width: isCurrent ? 3 : 1,
              ),
            ),
            color: isUnlocked ? theme.backgroundColor : Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isUnlocked ? theme.boardColor : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      isUnlocked ? theme.icon : '🔒',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          theme.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isUnlocked ? Colors.black : Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Открывается на ${theme.unlockLevel} ур.',
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Меню: ${theme.sampleItems}',
                          style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  if (isCurrent)
                    const Chip(
                      label: Text('Текущая', style: TextStyle(color: Colors.white, fontSize: 10)),
                      backgroundColor: Colors.amber,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}