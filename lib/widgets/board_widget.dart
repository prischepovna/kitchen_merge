import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/game_provider.dart';
import '../models/item_model.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();
    final theme = game.currentTheme;

    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.boardColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: theme.borderColor, width: 4),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemCount: game.boardSize,
          itemBuilder: (context, index) {
            final item = game.board[index];
            bool isLocked = game.lockedCells.contains(index);

            return DragTarget<int>(
              onAcceptWithDetails: (details) {
                game.mergeItems(details.data, index);
              },
              builder: (context, candidateData, rejectedData) {
                return GestureDetector(
                  onTap: () {
                    if (item != null && item.isGenerator) {
                      game.spawnFromGenerator(index);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isLocked
                          ? Colors.blueGrey.shade300
                          : (candidateData.isNotEmpty ? Colors.green.shade200 : theme.cellColor),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isLocked
                            ? Colors.cyanAccent
                            : ((item != null && item.level >= 4) ? Colors.amber.shade600 : theme.borderColor.withOpacity(0.3)),
                        width: (item != null && item.level >= 4 || isLocked) ? 2.5 : 1,
                      ),
                    ),
                    child: isLocked
                        ? const Center(child: Text('🧊', style: TextStyle(fontSize: 22)))
                        : (item != null
                            ? Draggable<int>(
                                data: index,
                                feedback: Material(
                                  color: Colors.transparent,
                                  child: _buildItemContent(item, isDragging: true),
                                ),
                                childWhenDragging: Opacity(
                                  opacity: 0.3,
                                  child: _buildItemContent(item),
                                ),
                                child: _buildItemContent(item),
                              )
                            : const SizedBox.shrink()),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildItemContent(ItemModel item, {bool isDragging = false}) {
    double size = isDragging ? 60 : 50;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(item.icon, style: TextStyle(fontSize: isDragging ? 36 : 26)),
          if (!item.isGenerator)
            Positioned(
              right: 2,
              bottom: 2,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: item.category == ItemCategory.bakery ? Colors.blueAccent : Colors.pinkAccent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${item.level}',
                  style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }
}