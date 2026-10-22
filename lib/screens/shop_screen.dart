import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/board_theme_model.dart';
import '../state/game_provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ярмарка и Скины'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.shopping_bag), text: 'Рынок'),
              Tab(icon: Icon(Icons.palette), text: 'Темы Стола'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildMarketTab(context, game),
            _buildThemesTab(context, game),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketTab(BuildContext context, GameProvider game) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Покупки за монеты 🪙', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _shopCard(
          title: '+30 Энергии ⚡',
          subtitle: 'Пополнить бак энергии',
          icon: '⚡',
          priceTag: '100 🪙',
          color: Colors.orange,
          onTap: () {
            if (!game.buyEnergyWithCoins()) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не хватает монет!')));
            }
          },
        ),
        _shopCard(
          title: 'Экспресс Мука 🌾',
          subtitle: 'Сразу на доску',
          icon: '🌾',
          priceTag: '50 🪙',
          color: Colors.amber,
          onTap: () {
            if (!game.buyIngredientWithCoins()) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Нет места или не хватает монет!')));
            }
          },
        ),
        const Divider(height: 32),
        const Text('Премиум & Реклама 💎', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _shopCard(
          title: 'Бесплатная Энергия',
          subtitle: 'За просмотр видео',
          icon: '📺',
          priceTag: '+30 ⚡',
          color: Colors.green,
          onTap: () {
            game.addEnergy(30);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('📺 Реклама просмотрена!')));
          },
        ),
        _shopCard(
          title: 'Сундук Кристаллов',
          subtitle: '100 Премиум гемов',
          icon: '💎',
          priceTag: '\$1.99',
          color: Colors.purple,
          onTap: () {
            game.addGems(100);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('💳 Успешная покупка!')));
          },
        ),
      ],
    );
  }

  Widget _buildThemesTab(BuildContext context, GameProvider game) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: BoardThemeDatabase.themes.length,
      itemBuilder: (context, index) {
        final theme = BoardThemeDatabase.themes[index];
        bool isUnlocked = game.unlockedThemeIds.contains(theme.id);
        bool isSelected = game.currentThemeId == theme.id;

        String priceText = 'Куплено';
        if (!isUnlocked) {
          priceText = theme.priceCoins > 0 ? '${theme.priceCoins} 🪙' : '${theme.priceGems} 💎';
        }

        return Card(
          elevation: isSelected ? 4 : 1,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: isSelected ? Colors.green : Colors.black12, width: isSelected ? 2 : 1),
          ),
          child: ListTile(
            leading: CircleAvatar(backgroundColor: theme.boardColor),
            title: Text(theme.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(isSelected ? 'Активна' : (isUnlocked ? 'Доступна' : 'Заблокирована')),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Colors.grey : (isUnlocked ? Colors.green : Colors.orange),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (isSelected) return;
                if (isUnlocked) {
                  game.selectTheme(theme.id);
                } else {
                  if (!game.unlockTheme(theme)) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не хватает средств!')));
                  }
                }
              },
              child: Text(isSelected ? 'Выбрана' : (isUnlocked ? 'Надеть' : priceText)),
            ),
          ),
        );
      },
    );
  }

  Widget _shopCard({
    required String title,
    required String subtitle,
    required String icon,
    required String priceTag,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Text(icon, style: const TextStyle(fontSize: 32)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white),
          onPressed: onTap,
          child: Text(priceTag),
        ),
      ),
    );
  }
}