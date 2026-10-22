import 'package:flutter/material.dart';

class BoardThemeModel {
  final String id;
  final String name;
  final int unlockLevel;
  final Color backgroundColor;
  final Color boardColor;
  final Color borderColor;
  final Color cellColor;
  final String icon;
  final String foodGenIcon;
  final String drinkGenIcon;
  final String sampleItems;
  final int priceCoins;
  final int priceGems;

  BoardThemeModel({
    required this.id,
    required this.name,
    required this.unlockLevel,
    required this.backgroundColor,
    required this.boardColor,
    required this.borderColor,
    required this.cellColor,
    required this.icon,
    required this.foodGenIcon,
    required this.drinkGenIcon,
    required this.sampleItems,
    this.priceCoins = 0,
    this.priceGems = 0,
  });
}

class BoardThemeDatabase {
  static List<BoardThemeModel> themes = [
    BoardThemeModel(
      id: 'bakery', name: '1. Уютная Пекарня', unlockLevel: 1,
      backgroundColor: Colors.orange.shade50, boardColor: Colors.brown.shade100,
      borderColor: Colors.brown.shade400, cellColor: Colors.amber.shade50,
      icon: '🥐', foodGenIcon: '📦', drinkGenIcon: '🧃', sampleItems: '🌾 🍞 🥯 🍔 🍱 + 🧊 💧 🥤 ☕ 🍹',
    ),
    BoardThemeModel(
      id: 'italian_pizza', name: '2. Итальянская Пиццерия', unlockLevel: 21,
      backgroundColor: Colors.red.shade50, boardColor: Colors.red.shade900,
      borderColor: Colors.orange.shade800, cellColor: Colors.amber.shade100,
      icon: '🍕', foodGenIcon: '🥖', drinkGenIcon: '🍾', sampleItems: '🧀 🍅 🍕 🍝 🧄 + 🍷 🥤 🥂 🧃 🍸',
    ),
    BoardThemeModel(
      id: 'tropical_bar', name: '3. Тропический Шейк-Бар', unlockLevel: 41,
      backgroundColor: Colors.cyan.shade50, boardColor: Colors.teal.shade700,
      borderColor: Colors.cyan.shade400, cellColor: Colors.teal.shade50,
      icon: '🍹', foodGenIcon: '🥥', drinkGenIcon: '🍍', sampleItems: '🍌 🍉 🥭 🍧 🍨 + 🥤 🧃 🍹 🧉 🥥',
    ),
    BoardThemeModel(
      id: 'sushi_tokyo', name: '4. Токийский Суши-Бар', unlockLevel: 61,
      backgroundColor: Colors.grey.shade100, boardColor: Colors.grey.shade900,
      borderColor: Colors.redAccent, cellColor: Colors.grey.shade800,
      icon: '🍣', foodGenIcon: '🍚', drinkGenIcon: '🫖', sampleItems: '🍙 🍘 🍣 🍱 🦪 + 🍵 🍶 🧋 🧊 🍺',
    ),
    BoardThemeModel(
      id: 'french_patisserie', name: '5. Французская Кондитерская', unlockLevel: 81,
      backgroundColor: Colors.pink.shade50, boardColor: Colors.pink.shade100,
      borderColor: Colors.pink.shade400, cellColor: Colors.pink.shade50,
      icon: '🧁', foodGenIcon: '🥞', drinkGenIcon: '🥛', sampleItems: '🍰 🎂 🧁 🥧 🧇 + ☕ 🥛 🧋 🍫 🍷',
    ),
    BoardThemeModel(
      id: 'mexican_taco', name: '6. Мексиканская Такерия', unlockLevel: 101,
      backgroundColor: Colors.amber.shade50, boardColor: Colors.amber.shade800,
      borderColor: Colors.deepOrange, cellColor: Colors.amber.shade100,
      icon: '🌮', foodGenIcon: '🌽', drinkGenIcon: '🏺', sampleItems: '🌶️ 🌮 🌯 🥗 🥑 + 🥤 🍺 🍹 🍸 🧃',
    ),
    BoardThemeModel(
      id: 'burger_diner', name: '7. Американский Дайнер', unlockLevel: 121,
      backgroundColor: Colors.yellow.shade50, boardColor: Colors.blue.shade800,
      borderColor: Colors.yellow.shade600, cellColor: Colors.blue.shade50,
      icon: '🍔', foodGenIcon: '🍟', drinkGenIcon: '🥤', sampleItems: '🌭 🍟 🍔 🥩 🍗 + 🥤 🥛 🧃 🍺 ☕',
    ),
    BoardThemeModel(
      id: 'cyber_ramen', name: '8. Киберпанк Раменная', unlockLevel: 141,
      backgroundColor: const Color(0xFF0D0B1D), boardColor: const Color(0xFF1E1A3C),
      borderColor: Colors.cyanAccent, cellColor: const Color(0xFF2B2553),
      icon: '🍜', foodGenIcon: '🥢', drinkGenIcon: '🍾', sampleItems: '🥚 🥟 🍜 🍢 🍲 + 🍵 ⚡ 🧋 🍶 🧪',
    ),
    BoardThemeModel(
      id: 'hipster_coffee', name: '9. Хипстерская Кофейня', unlockLevel: 161,
      backgroundColor: Colors.brown.shade50, boardColor: Colors.brown.shade300,
      borderColor: Colors.brown.shade700, cellColor: Colors.brown.shade100,
      icon: '☕', foodGenIcon: '🥐', drinkGenIcon: '🫘', sampleItems: '🥪 🥯 🍪 🍩 🥐 + ☕ 🍵 🧋 🥛 🥤',
    ),
    BoardThemeModel(
      id: 'candy_factory', name: '10. Конфетная Фабрика', unlockLevel: 181,
      backgroundColor: Colors.purple.shade50, boardColor: Colors.purple.shade200,
      borderColor: Colors.purple.shade500, cellColor: Colors.purple.shade50,
      icon: '🍬', foodGenIcon: '🍭', drinkGenIcon: '🧃', sampleItems: '🍬 🍭 🍫 🍩 🍪 + 🥤 🧃 🥛 🧋 🍧',
    ),
    BoardThemeModel(
      id: 'pirate_tavern', name: '11. Пиратская Таверна', unlockLevel: 201,
      backgroundColor: Colors.brown.shade100, boardColor: Colors.brown.shade900,
      borderColor: Colors.amber.shade700, cellColor: Colors.brown.shade800,
      icon: '🏴‍☠️', foodGenIcon: '🍖', drinkGenIcon: '🛢️', sampleItems: '🍞 🧀 🍖 🍗 🐟 + 🍺 🍷 🧃 🍾 🍸',
    ),
    BoardThemeModel(
      id: 'space_station', name: '12. Космический Закусочный', unlockLevel: 221,
      backgroundColor: Colors.indigo.shade900, boardColor: Colors.deepPurple.shade900,
      borderColor: Colors.purpleAccent, cellColor: Colors.deepPurple.shade800,
      icon: '🛸', foodGenIcon: '🧪', drinkGenIcon: '🔋', sampleItems: '💊 🥩 🍔 🍕 🍱 + 🧪 🧃 ⚡ 🥤 🍵',
    ),
    BoardThemeModel(
      id: 'magic_pub', name: '13. Таверна Магов', unlockLevel: 241,
      backgroundColor: Colors.deepPurple.shade50, boardColor: Colors.indigo.shade700,
      borderColor: Colors.amber, cellColor: Colors.indigo.shade100,
      icon: '🧙‍♂️', foodGenIcon: '📜', drinkGenIcon: '🧪', sampleItems: '🍄 🍗 🥧 🥩 🍲 + 🧪 🍷 🧃 🍵 🔮',
    ),
    BoardThemeModel(
      id: 'steampunk_baking', name: '14. Стимпанк Кафе', unlockLevel: 261,
      backgroundColor: Colors.orange.shade100, boardColor: Colors.blueGrey.shade800,
      borderColor: Colors.brown.shade600, cellColor: Colors.blueGrey.shade700,
      icon: '⚙️', foodGenIcon: '⚙️', drinkGenIcon: '🫖', sampleItems: '🍞 🥧 🥩 🍔 🥪 + ☕ 🫖 🥤 🍺 🍸',
    ),
    BoardThemeModel(
      id: 'ice_palace', name: '15. Ледяной Ресторан', unlockLevel: 281,
      backgroundColor: Colors.lightBlue.shade50, boardColor: Colors.cyan.shade800,
      borderColor: Colors.lightBlueAccent, cellColor: Colors.cyan.shade700,
      icon: '❄️', foodGenIcon: '🧊', drinkGenIcon: '❄️', sampleItems: '🍧 🍨 🍦 🍣 🥗 + 🧊 💧 🥤 🍹 🍸',
    ),
    BoardThemeModel(
      id: 'seafood_wharf', name: '16. Морской Причал', unlockLevel: 301,
      backgroundColor: Colors.blue.shade50, boardColor: Colors.blue.shade900,
      borderColor: Colors.lightBlue, cellColor: Colors.blue.shade800,
      icon: '🦞', foodGenIcon: '⚓', drinkGenIcon: '🍋', sampleItems: '🦐 🦞 🦀 🦑 🦪 + 🥂 🍷 🥤 🍹 🍺',
    ),
    BoardThemeModel(
      id: 'indian_spice', name: '17. Индийский Дворец Специй', unlockLevel: 321,
      backgroundColor: Colors.orange.shade100, boardColor: Colors.deepOrange.shade800,
      borderColor: Colors.amber, cellColor: Colors.orange.shade700,
      icon: '🍛', foodGenIcon: '🫓', drinkGenIcon: '🍶', sampleItems: '🫓 🍛 🥘 🧄 🍢 + 🍵 🧋 🧃 🥤 🥛',
    ),
    BoardThemeModel(
      id: 'wild_west_saloon', name: '18. Дикий Салун', unlockLevel: 341,
      backgroundColor: Colors.brown.shade200, boardColor: Colors.brown.shade800,
      borderColor: Colors.orange.shade900, cellColor: Colors.brown.shade600,
      icon: '🤠', foodGenIcon: '🪕', drinkGenIcon: '🍺', sampleItems: '🥩 🍖 🥔 🍞 🥫 + 🍺 🥃 🍷 ☕ 🥤',
    ),
    BoardThemeModel(
      id: 'greek_olympus', name: '19. Греческая Таверна Олимп', unlockLevel: 361,
      backgroundColor: Colors.blue.shade50, boardColor: Colors.blue.shade300,
      borderColor: Colors.amber.shade700, cellColor: Colors.white,
      icon: '🏛️', foodGenIcon: '🫒', drinkGenIcon: '🏺', sampleItems: '🫒 🧀 🥗 🥙 🍖 + 🍷 🥂 💧 🧃 🍹',
    ),
    BoardThemeModel(
      id: 'royal_banquet', name: '20. Королевский Банкет', unlockLevel: 381,
      backgroundColor: Colors.purple.shade50, boardColor: Colors.purple.shade900,
      borderColor: Colors.amber, cellColor: Colors.purple.shade800,
      icon: '👑', foodGenIcon: '🏰', drinkGenIcon: '🏆', sampleItems: '🍗 🥩 🦞 🥧 🎂 + 🥂 🍾 🍷 🍸 🍹',
    ),
    BoardThemeModel(
      id: 'safari_bbq', name: '21. Сафари Барбекю', unlockLevel: 401,
      backgroundColor: Colors.yellow.shade100, boardColor: Colors.brown.shade800,
      borderColor: Colors.orange, cellColor: Colors.amber.shade200,
      icon: '🦁', foodGenIcon: '🔥', drinkGenIcon: '🥥', sampleItems: '🥩 🍖 🥓 🍗 🌶️ + 🍷 🥤 🧃 🍺 🧉',
    ),
    BoardThemeModel(
      id: 'alpine_chalet', name: '22. Альпийская Сырная Хижина', unlockLevel: 421,
      backgroundColor: Colors.teal.shade50, boardColor: Colors.blueGrey.shade700,
      borderColor: Colors.tealAccent, cellColor: Colors.blueGrey.shade100,
      icon: '🧀', foodGenIcon: '🪵', drinkGenIcon: '🫖', sampleItems: '🧀 🥖 🧈 🥓 🥔 + 🫖 ☕ 🥛 🍷 🧋',
    ),
    BoardThemeModel(
      id: 'egyptian_oasis', name: '23. Египетский Оазис', unlockLevel: 441,
      backgroundColor: Colors.amber.shade100, boardColor: Colors.amber.shade900,
      borderColor: Colors.yellowAccent, cellColor: Colors.amber.shade200,
      icon: '🐪', foodGenIcon: '🏺', drinkGenIcon: '🌴', sampleItems: '🧆 🥙 🫓 🍯 🧄 + 🧃 🍵 💧 🍷 🍸',
    ),
    BoardThemeModel(
      id: 'underwater_atlantis', name: '24. Подводная Атлантида', unlockLevel: 461,
      backgroundColor: Colors.cyan.shade100, boardColor: Colors.indigo.shade900,
      borderColor: Colors.cyanAccent, cellColor: Colors.indigo.shade800,
      icon: '🧜‍♀️', foodGenIcon: '🐚', drinkGenIcon: '🌊', sampleItems: '🐟 🦐 🦑 🦀 🦪 + 💧 🥤 🍹 🍸 🧊',
    ),
    BoardThemeModel(
      id: 'disco_club', name: '25. Диско-Клуб 80-х', unlockLevel: 481,
      backgroundColor: Colors.pink.shade100, boardColor: Colors.purple.shade900,
      borderColor: Colors.pinkAccent, cellColor: Colors.purple.shade800,
      icon: '🕺', foodGenIcon: '💿', drinkGenIcon: '🍸', sampleItems: '🍕 🍟 🍔 🍿 🥪 + 🍸 🍹 🍾 🥂 🥃',
    ),
    BoardThemeModel(
      id: 'dracula_castle', name: '26. Замок Дракулы', unlockLevel: 501,
      backgroundColor: Colors.red.shade900, boardColor: Colors.black,
      borderColor: Colors.redAccent, cellColor: Colors.grey.shade900,
      icon: '🦇', foodGenIcon: '⚰️', drinkGenIcon: '🍷', sampleItems: '🥩 🍖 🧀 🥖 🍎 + 🍷 🩸 🥂 🥃 ☕',
    ),
    BoardThemeModel(
      id: 'viking_village', name: '27. Деревня Викингов', unlockLevel: 521,
      backgroundColor: Colors.blueGrey.shade100, boardColor: Colors.blueGrey.shade900,
      borderColor: Colors.brown, cellColor: Colors.blueGrey.shade800,
      icon: '🪓', foodGenIcon: '🛡️', drinkGenIcon: '🍺', sampleItems: '🍖 🐟 🍞 🧀 🥔 + 🍺 🍯 🍷 🥃 🥛',
    ),
    BoardThemeModel(
      id: 'hawaiian_tiki', name: '28. Гавайский Тики-Бар', unlockLevel: 541,
      backgroundColor: Colors.orange.shade100, boardColor: Colors.deepOrange.shade800,
      borderColor: Colors.yellow, cellColor: Colors.orange.shade200,
      icon: '🗿', foodGenIcon: '🍍', drinkGenIcon: '🥥', sampleItems: '🍍 🍌 🍉 🥭 🦐 + 🍹 🥥 🥤 🧊 🍸',
    ),
    BoardThemeModel(
      id: 'mad_scientist', name: '29. Лаборатория Алхимика', unlockLevel: 561,
      backgroundColor: Colors.green.shade100, boardColor: Colors.green.shade900,
      borderColor: Colors.greenAccent, cellColor: Colors.green.shade800,
      icon: '⚗️', foodGenIcon: '⚡', drinkGenIcon: '🧪', sampleItems: '🍄 🍎 🍞 🥩 🧀 + 🧪 ⚡ 🔋 🍵 💧',
    ),
    BoardThemeModel(
      id: 'circus_tent', name: '30. Цирк Шапито', unlockLevel: 581,
      backgroundColor: Colors.red.shade100, boardColor: Colors.red.shade800,
      borderColor: Colors.yellow, cellColor: Colors.red.shade200,
      icon: '🎪', foodGenIcon: '🍿', drinkGenIcon: '🥤', sampleItems: '🍿 🍬 🍩 🍎 🌭 + 🥤 🧃 🥛 🍧 ☕',
    ),
    BoardThemeModel(
      id: 'dino_park', name: '31. Парк Юрского Периода', unlockLevel: 601,
      backgroundColor: Colors.green.shade50, boardColor: Colors.green.shade800,
      borderColor: Colors.lime, cellColor: Colors.green.shade100,
      icon: '🦖', foodGenIcon: '🌿', drinkGenIcon: '🥚', sampleItems: '🥩 🍖 🍃 🥔 🍄 + 💧 🧃 🧉 🥥 🍵',
    ),
    BoardThemeModel(
      id: 'retro_cinema', name: '32. Ретро-Кинотеатр', unlockLevel: 621,
      backgroundColor: Colors.yellow.shade100, boardColor: Colors.red.shade900,
      borderColor: Colors.amber, cellColor: Colors.red.shade800,
      icon: '🎬', foodGenIcon: '🍿', drinkGenIcon: '🥤', sampleItems: '🍿 🌭 🍫 🥨 🍟 + 🥤 🧃 🥛 🍺 ☕',
    ),
    BoardThemeModel(
      id: 'sky_castle', name: '33. Небесный Облачный Замок', unlockLevel: 641,
      backgroundColor: Colors.lightBlue.shade100, boardColor: Colors.indigo.shade300,
      borderColor: Colors.white, cellColor: Colors.lightBlue.shade50,
      icon: '☁️', foodGenIcon: '🍯', drinkGenIcon: '✨', sampleItems: '🥞 🧇 🥐 🍑 🍇 + 🍵 🥛 🧋 🥂 🍷',
    ),
    BoardThemeModel(
      id: 'amazon_jungle', name: '34. Джунгли Амазонки', unlockLevel: 661,
      backgroundColor: Colors.lime.shade100, boardColor: Colors.green.shade900,
      borderColor: Colors.limeAccent, cellColor: Colors.green.shade700,
      icon: '🌴', foodGenIcon: '🍌', drinkGenIcon: '🧉', sampleItems: '🍌 🍍 🥑 🥥 🥭 + 🧉 🥤 🧃 🥥 🍵',
    ),
    BoardThemeModel(
      id: 'medieval_tourney', name: '35. Рыцарский Турнир', unlockLevel: 681,
      backgroundColor: Colors.blueGrey.shade100, boardColor: Colors.grey.shade800,
      borderColor: Colors.amber.shade700, cellColor: Colors.blueGrey.shade200,
      icon: '🛡️', foodGenIcon: '🍗', drinkGenIcon: '🍺', sampleItems: '🍗 🥩 🍞 🧀 🥧 + 🍺 🍷 🥃 🧃 🥂',
    ),
    BoardThemeModel(
      id: 'neon_tokyo_night', name: '36. Неоновый Токио (Ночь)', unlockLevel: 701,
      backgroundColor: const Color(0xFF1A0033), boardColor: const Color(0xFF330066),
      borderColor: Colors.pinkAccent, cellColor: const Color(0xFF4D0099),
      icon: '🌆', foodGenIcon: '🍢', drinkGenIcon: '🍸', sampleItems: '🍜 🥟 🍣 🍱 🍘 + 🍸 🥃 🍶 🧋 ⚡',
    ),
    BoardThemeModel(
      id: 'arctic_station', name: '37. Арктическая Станция', unlockLevel: 721,
      backgroundColor: Colors.blue.shade100, boardColor: Colors.cyan.shade900,
      borderColor: Colors.white, cellColor: Colors.cyan.shade800,
      icon: '🧊', foodGenIcon: '🥫', drinkGenIcon: '☕', sampleItems: '🍞 🧀 🥩 🐟 🍪 + ☕ 🫖 🧃 🥛 🧊',
    ),
    BoardThemeModel(
      id: 'oriental_bazaar', name: '38. Восточный Базар', unlockLevel: 741,
      backgroundColor: Colors.orange.shade100, boardColor: Colors.deepOrange.shade900,
      borderColor: Colors.amber, cellColor: Colors.orange.shade200,
      icon: '🧞‍♂️', foodGenIcon: '🧆', drinkGenIcon: '🫖', sampleItems: '🧆 🫓 🍯 🥜 🧄 + 🫖 🍵 🧃 🍷 🥛',
    ),
    BoardThemeModel(
      id: 'chess_kingdom', name: '39. Шахматное Королевство', unlockLevel: 761,
      backgroundColor: Colors.grey.shade300, boardColor: Colors.grey.shade900,
      borderColor: Colors.white, cellColor: Colors.grey.shade700,
      icon: '♟️', foodGenIcon: '🍰', drinkGenIcon: '🍵', sampleItems: '🍰 🧁 🍪 🍩 🍫 + 🍵 ☕ 🧋 🥛 🥂',
    ),
    BoardThemeModel(
      id: 'treasure_island', name: '40. Остров Сокровищ', unlockLevel: 781,
      backgroundColor: Colors.yellow.shade100, boardColor: Colors.brown.shade700,
      borderColor: Colors.amber, cellColor: Colors.amber.shade200,
      icon: '🪙', foodGenIcon: '🥥', drinkGenIcon: '🍹', sampleItems: '🥥 🍌 🐟 🍍 🦐 + 🍹 🥥 🥤 🥃 🍷',
    ),
    BoardThemeModel(
      id: 'penthouse_bar', name: '41. Пентхаус Лаунж', unlockLevel: 801,
      backgroundColor: Colors.blueGrey.shade900, boardColor: Colors.black,
      borderColor: Colors.amberAccent, cellColor: Colors.grey.shade900,
      icon: '🏙️', foodGenIcon: '🍣', drinkGenIcon: '🥂', sampleItems: '🍣 🧀 🍇 🥩 + 🥂 🍾 🍸 🥃 🍷',
    ),
    BoardThemeModel(
      id: 'farmers_market', name: '42. Фермерский Ярмарочный Двор', unlockLevel: 821,
      backgroundColor: Colors.lightGreen.shade100, boardColor: Colors.brown.shade600,
      borderColor: Colors.lime, cellColor: Colors.lightGreen.shade50,
      icon: '🥕', foodGenIcon: '🍎', drinkGenIcon: '🥛', sampleItems: '🍎 🥕 🌽 🧀 🍞 + 🥛 🧃 ☕ 🍵 🍺',
    ),
    BoardThemeModel(
      id: 'retro_diner_50s', name: '43. Закусочная 50-х (Рокабилли)', unlockLevel: 841,
      backgroundColor: Colors.pink.shade50, boardColor: Colors.red.shade700,
      borderColor: Colors.cyanAccent, cellColor: Colors.pink.shade100,
      icon: '🎸', foodGenIcon: '🍔', drinkGenIcon: '🥤', sampleItems: '🍔 🍟 🌭 🥓 🥞 + 🥤 🥛 ☕ 🍧 🍺',
    ),
    BoardThemeModel(
      id: 'maya_temple', name: '44. Храм Древних Майя', unlockLevel: 861,
      backgroundColor: Colors.amber.shade200, boardColor: Colors.brown.shade900,
      borderColor: Colors.amber.shade800, cellColor: Colors.amber.shade100,
      icon: '🛕', foodGenIcon: '🌽', drinkGenIcon: '🍫', sampleItems: '🌽 🍫 🥑 🍅 🧆 + 🍵 🧃 💧 🧉 🍷',
    ),
    BoardThemeModel(
      id: 'gnome_mine', name: '45. Подземная Шахта Гномов', unlockLevel: 881,
      backgroundColor: Colors.brown.shade300, boardColor: Colors.brown.shade900,
      borderColor: Colors.orangeAccent, cellColor: Colors.brown.shade800,
      icon: '⛏️', foodGenIcon: '🍄', drinkGenIcon: '🍺', sampleItems: '🍄 🧀 🍞 🥩 🥔 + 🍺 🥃 🍷 ☕ 🧃',
    ),
    BoardThemeModel(
      id: 'music_festival', name: '46. Музыкальный Опен-Эйр', unlockLevel: 901,
      backgroundColor: Colors.purple.shade100, boardColor: Colors.indigo.shade900,
      borderColor: Colors.pinkAccent, cellColor: Colors.purple.shade200,
      icon: '🎸', foodGenIcon: '🌭', drinkGenIcon: '🍻', sampleItems: '🌭 🍕 🍟 🍿 🥨 + 🍻 🍷 🥤 🍹 🥃',
    ),
    BoardThemeModel(
      id: 'venetian_carnival', name: '47. Венецианский Карнавал', unlockLevel: 921,
      backgroundColor: Colors.amber.shade100, boardColor: Colors.blue.shade900,
      borderColor: Colors.amber, cellColor: Colors.blue.shade800,
      icon: '🎭', foodGenIcon: '🥖', drinkGenIcon: '🍷', sampleItems: '🥖 🧀 🍰 🍇 🥩 + 🍷 🥂 🍾 🍸 🍹',
    ),
    BoardThemeModel(
      id: 'mars_colony', name: '48. Марсианская Колония', unlockLevel: 941,
      backgroundColor: Colors.deepOrange.shade100, boardColor: Colors.deepOrange.shade900,
      borderColor: Colors.redAccent, cellColor: Colors.deepOrange.shade800,
      icon: '🚀', foodGenIcon: '🧪', drinkGenIcon: '⚡', sampleItems: '💊 🥩 🍔 🍕 🍱 + 🧪 🧃 ⚡ 🥤 🍵',
    ),
    BoardThemeModel(
      id: 'elf_forest', name: '49. Сказочный Лес Эльфов', unlockLevel: 961,
      backgroundColor: Colors.lightGreen.shade200, boardColor: Colors.green.shade900,
      borderColor: Colors.lightGreenAccent, cellColor: Colors.green.shade800,
      icon: '🧝‍♀️', foodGenIcon: '🍓', drinkGenIcon: '🍯', sampleItems: '🍓 🫐 🍎 🥐 🍯 + 🍵 🥛 🧋 🥂 🍷',
    ),
    BoardThemeModel(
      id: 'garden_of_eden', name: '50. Эдемский Сад Богов', unlockLevel: 981,
      backgroundColor: Colors.amber.shade50, boardColor: Colors.teal.shade900,
      borderColor: Colors.amberAccent, cellColor: Colors.teal.shade800,
      icon: '🕊️', foodGenIcon: '🍎', drinkGenIcon: '🍾', sampleItems: '🍎 🍇 🍑 🍯 🧀 + 🍾 🥂 🍷 🍸 🍹',
    ),
  ];
}