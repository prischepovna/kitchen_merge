import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/item_model.dart';
import '../models/order_model.dart';
import '../models/board_theme_model.dart';
import '../models/chef_skin_model.dart';

class GameProvider extends ChangeNotifier {
  int coins = 250;
  int gems = 15;
  int energy = 50;
  final int maxEnergy = 100;

  int playerLevel = 1;
  int currentXp = 0;
  int maxXp = 100;

  List<String> unlockedThemeIds = ['bakery'];
  String currentThemeId = 'bakery';

  BoardThemeModel get currentTheme {
    return BoardThemeDatabase.themes.firstWhere(
      (t) => t.id == currentThemeId,
      orElse: () => BoardThemeDatabase.themes.first,
    );
  }

  final int boardSize = 25;
  late List<ItemModel?> board;
  Set<int> lockedCells = {6, 18};

  List<OrderModel> activeOrders = [];

  GameProvider() {
    _initGame();
  }

  void _initGame() {
    board = List.generate(boardSize, (index) => null);
    board[11] = ItemDatabase.bakeryGenerator;
    board[13] = ItemDatabase.drinkGenerator;
    _generateOrders();
  }

  void selectTheme(String themeId) {
    if (unlockedThemeIds.contains(themeId)) {
      currentThemeId = themeId;
      notifyListeners();
    }
  }

// Скин шефа по умолчанию
  String currentChefSkinId = 'default_chef';

  ChefSkinModel get currentChefSkin {
    return ChefSkinDatabase.skins.firstWhere(
      (s) => s.id == currentChefSkinId,
      orElse: () => ChefSkinDatabase.skins.first,
    );
  }

  void selectChefSkin(String skinId) {
    final skin = ChefSkinDatabase.skins.firstWhere((s) => s.id == skinId);
    if (playerLevel >= skin.unlockLevel) {
      currentChefSkinId = skinId;
      notifyListeners();
    }
  }



  bool unlockTheme(BoardThemeModel theme) {
    if (unlockedThemeIds.contains(theme.id)) return true;

    if (theme.priceCoins > 0 && coins >= theme.priceCoins) {
      coins -= theme.priceCoins;
      unlockedThemeIds.add(theme.id);
      currentThemeId = theme.id;
      notifyListeners();
      return true;
    } else if (theme.priceGems > 0 && gems >= theme.priceGems) {
      gems -= theme.priceGems;
      unlockedThemeIds.add(theme.id);
      currentThemeId = theme.id;
      notifyListeners();
      return true;
    } else if (playerLevel >= theme.unlockLevel) {
      unlockedThemeIds.add(theme.id);
      currentThemeId = theme.id;
      notifyListeners();
      return true;
    }
    return false;
  }

  void addGems(int amount) {
    gems += amount;
    notifyListeners();
  }

  bool buyIngredientWithCoins() {
    if (coins >= 50) {
      int emptyIndex = -1;
      for (int i = 0; i < boardSize; i++) {
        if (board[i] == null && !lockedCells.contains(i)) {
          emptyIndex = i;
          break;
        }
      }

      if (emptyIndex != -1) {
        coins -= 50;
        board[emptyIndex] = ItemDatabase.bakeryChain[0].copyWith(
          id: 'item_${DateTime.now().millisecondsSinceEpoch}',
        );
        notifyListeners();
        return true;
      }
    }
    return false;
  }

  void spawnFromGenerator(int index) {
    ItemModel? gen = board[index];
    if (gen == null || !gen.isGenerator || energy <= 0) return;

    final random = Random();
    bool saveEnergy = playerLevel >= 5 && random.nextDouble() < 0.15;

    if (!saveEnergy) {
      energy--;
    } else {
      HapticFeedback.lightImpact();
    }

    int emptyIndex = -1;
    for (int i = 0; i < boardSize; i++) {
      if (board[i] == null && !lockedCells.contains(i)) {
        emptyIndex = i;
        break;
      }
    }

    if (emptyIndex != -1) {
      ItemModel newItem = (gen.id == 'gen_bakery')
          ? ItemDatabase.bakeryChain[0]
          : ItemDatabase.drinksChain[0];

      board[emptyIndex] = newItem.copyWith(
        id: 'item_${DateTime.now().millisecondsSinceEpoch}_${random.nextInt(999)}',
      );
      notifyListeners();
    }
  }

  bool mergeItems(int fromIndex, int toIndex) {
    if (fromIndex == toIndex) return false;
    if (lockedCells.contains(toIndex) || lockedCells.contains(fromIndex)) return false;

    ItemModel? itemFrom = board[fromIndex];
    ItemModel? itemTo = board[toIndex];

    if (itemFrom == null) return false;

    if (itemTo == null) {
      board[toIndex] = itemFrom;
      board[fromIndex] = null;
      _checkAndBreakLocks(toIndex);
      HapticFeedback.selectionClick();
      notifyListeners();
      return true;
    }

    if (!itemFrom.isGenerator &&
        !itemTo.isGenerator &&
        itemFrom.category == itemTo.category &&
        itemFrom.level == itemTo.level) {

      List<ItemModel> chain = (itemFrom.category == ItemCategory.bakery)
          ? ItemDatabase.bakeryChain
          : ItemDatabase.drinksChain;

      if (itemFrom.level < chain.length) {
        ItemModel nextLevelItem = chain[itemFrom.level];

        board[toIndex] = nextLevelItem.copyWith(
          id: 'item_${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(999)}',
        );
        board[fromIndex] = null;

        if (nextLevelItem.level >= 4) {
          HapticFeedback.heavyImpact();
        } else {
          HapticFeedback.mediumImpact();
        }

        addXp(5 * itemFrom.level);
        _checkAndBreakLocks(toIndex);

        notifyListeners();
        return true;
      }
    }

    return false;
  }

  void _checkAndBreakLocks(int index) {
    int row = index ~/ 5;
    int col = index % 5;

    List<int> neighbors = [
      if (row > 0) index - 5,
      if (row < 4) index + 5,
      if (col > 0) index - 1,
      if (col < 4) index + 1,
    ];

    for (int n in neighbors) {
      if (lockedCells.contains(n)) {
        lockedCells.remove(n);
        HapticFeedback.mediumImpact();
      }
    }
  }

  bool canCompleteOrder(OrderModel order) {
    List<ItemModel?> tempBoard = List.from(board);
    for (var reqItem in order.requiredItems) {
      int foundIndex = tempBoard.indexWhere((item) =>
          item != null &&
          item.level == reqItem.level &&
          item.category == reqItem.category);
      if (foundIndex == -1) return false;
      tempBoard[foundIndex] = null;
    }
    return true;
  }

  void completeOrder(OrderModel order) {
    if (!canCompleteOrder(order)) return;

    for (var reqItem in order.requiredItems) {
      int itemIndex = board.indexWhere((item) =>
          item != null &&
          item.level == reqItem.level &&
          item.category == reqItem.category);
      if (itemIndex != -1) {
        board[itemIndex] = null;
      }
    }

    int finalCoins = playerLevel >= 3 ? (order.rewardCoins * 1.2).toInt() : order.rewardCoins;

    coins += finalCoins;
    if (order.isVip) gems += 2;
    addXp(order.rewardXp);

    activeOrders.removeWhere((o) => o.id == order.id);
    _generateOrders();
    HapticFeedback.mediumImpact();
    notifyListeners();
  }

  void addXp(int amount) {
    currentXp += amount;
    if (currentXp >= maxXp) {
      playerLevel++;
      currentXp -= maxXp;
      maxXp = (maxXp * 1.3).toInt();
      energy = maxEnergy;
      gems += 5;
      
      _spawnRandomLock();
    }
    notifyListeners();
  }

  void _spawnRandomLock() {
    for (int i = 0; i < boardSize; i++) {
      if (board[i] == null && !lockedCells.contains(i) && i != 11 && i != 13) {
        lockedCells.add(i);
        break;
      }
    }
  }

  void _generateOrders() {
    while (activeOrders.length < 3) {
      final random = Random();
      bool isVip = random.nextDouble() < 0.25;
      int itemCount = (playerLevel > 10 && random.nextBool()) ? 3 : (isVip ? 2 : 1);
      
      List<ItemModel> requiredItems = [];
      int totalCoins = 0;
      int totalXp = 0;

      for (int i = 0; i < itemCount; i++) {
        int level = random.nextInt(isVip ? 4 : 3) + 1;
        bool isBakery = random.nextBool();
        ItemModel item = isBakery
            ? ItemDatabase.bakeryChain[level - 1]
            : ItemDatabase.drinksChain[level - 1];

        requiredItems.add(item);
        totalCoins += level * 30;
        totalXp += level * 20;
      }

      if (isVip) {
        totalCoins = (totalCoins * 2.2).toInt();
        totalXp = (totalXp * 1.6).toInt();
      }

      activeOrders.add(OrderModel(
        id: 'order_${DateTime.now().millisecondsSinceEpoch}_${random.nextInt(1000)}',
        customerName: isVip ? '👑 VIP Инспектор' : 'Гость ${random.nextInt(100)}',
        customerAvatar: isVip ? '⭐' : ['🐱', '🐶', '🦊', '🐼', '🦁', '🦉'][random.nextInt(6)],
        requiredItems: requiredItems,
        rewardCoins: totalCoins,
        rewardXp: totalXp,
        isVip: isVip,
      ));
    }
  }

  bool buyEnergyWithCoins() {
    if (coins >= 100) {
      coins -= 100;
      addEnergy(30);
      notifyListeners();
      return true;
    }
    return false;
  }

  void addEnergy(int amount) {
    energy = (energy + amount).clamp(0, maxEnergy);
    notifyListeners();
  }
}