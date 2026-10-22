import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'shop_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade300, Colors.deepOrange.shade600],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('🍳', style: TextStyle(fontSize: 80)),
            const Text(
              'Kitchen Merge 5x5',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 40),
            _menuButton(context, 'Играть', Colors.green, () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const GameScreen()));
            }),
            const SizedBox(height: 16),
            _menuButton(context, 'Магазин 🛒', Colors.amber.shade800, () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ShopScreen()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(BuildContext context, String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}