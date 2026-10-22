import 'item_model.dart';

class OrderModel {
  final String id;
  final String customerName;
  final String customerAvatar;
  final List<ItemModel> requiredItems;
  final int rewardCoins;
  final int rewardXp;
  final bool isVip;

  OrderModel({
    required this.id,
    required this.customerName,
    required this.customerAvatar,
    required this.requiredItems,
    required this.rewardCoins,
    required this.rewardXp,
    this.isVip = false,
  });
}