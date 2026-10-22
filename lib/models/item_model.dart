import 'package:flutter/material.dart';

enum ItemCategory { bakery, drink, generator }

class ItemModel {
  final String id;
  final String name;
  final int level;
  final ItemCategory category;
  final String icon;
  final Color color;
  final bool isGenerator;

  ItemModel({
    required this.id,
    required this.name,
    required this.level,
    required this.category,
    required this.icon,
    required this.color,
    this.isGenerator = false,
  });

  ItemModel copyWith({String? id}) {
    return ItemModel(
      id: id ?? this.id,
      name: name,
      level: level,
      category: category,
      icon: icon,
      color: color,
      isGenerator: isGenerator,
    );
  }
}

class ItemDatabase {
  static ItemModel bakeryGenerator = ItemModel(
    id: 'gen_bakery',
    name: 'Печь',
    level: 0,
    category: ItemCategory.generator,
    icon: '📦',
    color: Colors.brown.shade400,
    isGenerator: true,
  );

  static ItemModel drinkGenerator = ItemModel(
    id: 'gen_drink',
    name: 'Кофемашина',
    level: 0,
    category: ItemCategory.generator,
    icon: '🧃',
    color: Colors.blue.shade300,
    isGenerator: true,
  );

  static List<ItemModel> bakeryChain = [
    ItemModel(id: 'b1', name: 'Мука', level: 1, category: ItemCategory.bakery, icon: '🌾', color: Colors.amber.shade100),
    ItemModel(id: 'b2', name: 'Тесто', level: 2, category: ItemCategory.bakery, icon: '🍞', color: Colors.orange.shade100),
    ItemModel(id: 'b3', name: 'Булочка', level: 3, category: ItemCategory.bakery, icon: '🥯', color: Colors.orange.shade200),
    ItemModel(id: 'b4', name: 'Бургер', level: 4, category: ItemCategory.bakery, icon: '🍔', color: Colors.deepOrange.shade300),
    ItemModel(id: 'b5', name: 'Королевский Сет', level: 5, category: ItemCategory.bakery, icon: '🍱', color: Colors.purple.shade300),
  ];

  static List<ItemModel> drinksChain = [
    ItemModel(id: 'd1', name: 'Лёд', level: 1, category: ItemCategory.drink, icon: '🧊', color: Colors.lightBlue.shade50),
    ItemModel(id: 'd2', name: 'Стакан Воды', level: 2, category: ItemCategory.drink, icon: '💧', color: Colors.lightBlue.shade100),
    ItemModel(id: 'd3', name: 'Лимонад', level: 3, category: ItemCategory.drink, icon: '🥤', color: Colors.yellow.shade200),
    ItemModel(id: 'd4', name: 'Холодный Кофе', level: 4, category: ItemCategory.drink, icon: '☕', color: Colors.brown.shade200),
    ItemModel(id: 'd5', name: 'Авторский Микс', level: 5, category: ItemCategory.drink, icon: '🍹', color: Colors.pink.shade200),
  ];
}