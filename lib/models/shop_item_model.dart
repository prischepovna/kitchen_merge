enum PaymentType { realMoney, rewardedAd }

class ShopItemModel {
  final String id;
  final String title;
  final String description;
  final String rewardAmount;
  final String priceTag;
  final PaymentType type;
  final String icon;

  ShopItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.rewardAmount,
    required this.priceTag,
    required this.type,
    required this.icon,
  });
}