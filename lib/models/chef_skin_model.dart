import 'package:flutter/material.dart';

class ChefSkinModel {
  final String id;
  final String name;
  final String avatar;
  final int unlockLevel;
  final String description;
  final double coinBonus;     // Бонус к монетам (1.1 = +10%)
  final double xpBonus;       // Бонус к опыту
  final double freeEnergyChance; // Шанс сэкономить энергию

  ChefSkinModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.unlockLevel,
    required this.description,
    this.coinBonus = 1.0,
    this.xpBonus = 1.0,
    this.freeEnergyChance = 0.0,
  });
}

class ChefSkinDatabase {
  static List<ChefSkinModel> skins = [
    ChefSkinModel(
      id: 'default_chef',
      name: '👨‍🍳 Новичок Шеф',
      avatar: '👨‍🍳',
      unlockLevel: 1,
      description: 'Базовый костюм повара. Без особых бонусов.',
    ),
    ChefSkinModel(
      id: 'pizzeria_chef',
      name: '🍕 Пиццайоло Марио',
      avatar: '👨‍🍳🍕',
      unlockLevel: 21,
      description: 'Бонус: +10% к монетам за заказы!',
      coinBonus: 1.10,
    ),
    ChefSkinModel(
      id: 'candy_chef',
      name: '🍬 Кондитер Маг',
      avatar: '🧙‍♂️🍬',
      unlockLevel: 181,
      description: 'Бонус: 10% шанс бесплатного клика генератора!',
      freeEnergyChance: 0.10,
    ),
    ChefSkinModel(
      id: 'pirate_chef',
      name: '🏴‍☠️ Капитан Кук',
      avatar: '🏴‍☠️🍖',
      unlockLevel: 201,
      description: 'Бонус: +15% к получаемому опыту!',
      xpBonus: 1.15,
    ),
    ChefSkinModel(
      id: 'greek_chef',
      name: '🏛️ Шеф-Олимпиец',
      avatar: '🏛️👨‍🍳',
      unlockLevel: 361,
      description: 'Бонус: +20% монет за греческие деликатесы!',
      coinBonus: 1.20,
    ),
    ChefSkinModel(
      id: 'atlantis_chef',
      name: '🧜‍♂️ Владыка Атлантиды',
      avatar: '🧜‍♂️🔱',
      unlockLevel: 461,
      description: 'Бонус: +15% к опыту и монетам!',
      coinBonus: 1.15,
      xpBonus: 1.15,
    ),
    ChefSkinModel(
      id: 'disco_chef',
      name: '🕺 Диско Повар',
      avatar: '🕺🪩',
      unlockLevel: 481,
      description: 'Бонус: 15% шанс бесплатного нажатия!',
      freeEnergyChance: 0.15,
    ),
    ChefSkinModel(
      id: 'cinema_chef',
      name: '🎬 Звезда Кино',
      avatar: '🎬🍿',
      unlockLevel: 621,
      description: 'Бонус: +25% монет за VIP заказы!',
      coinBonus: 1.25,
    ),
    ChefSkinModel(
      id: 'chess_chef',
      name: '♟️ Гроссмейстер Кухни',
      avatar: '♟️👑',
      unlockLevel: 761,
      description: 'Бонус: +20% опыта за любые мёржи!',
      xpBonus: 1.20,
    ),
    ChefSkinModel(
      id: 'mars_chef',
      name: '🚀 Кибер-Шеф Марса',
      avatar: '🚀🤖',
      unlockLevel: 941,
      description: 'Бонус: +30% монет и +25% опыта!',
      coinBonus: 1.30,
      xpBonus: 1.25,
    ),
  ];
}