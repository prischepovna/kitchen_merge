import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/game_provider.dart';
import '../widgets/top_bar_widget.dart';
import '../widgets/orders_widget.dart';
import '../widgets/board_widget.dart';
import '../widgets/chef_hero_widget.dart'; // Виджет крупного шефа
import 'shop_screen.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    return Scaffold(
      backgroundColor: game.currentTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Кухня Шефа'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.store),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ShopScreen()),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const TopBarWidget(),
            const SizedBox(height: 6),
            const ChefHeroWidget(), // 👨‍🍳 Крупный Шеф и его баффы в пустом месте над доской
            const OrdersWidget(),
            const Expanded(
              child: Center(
                child: BoardWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}