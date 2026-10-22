import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/game_provider.dart';
import 'screens/main_menu_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GameProvider(),
      child: const KitchenMergeApp(),
    ),
  );
}

class KitchenMergeApp extends StatelessWidget {
  const KitchenMergeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitchen Merge 5x5',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      home: const MainMenuScreen(),
    );
  }
}