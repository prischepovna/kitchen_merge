import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/game_provider.dart';
import '../models/order_model.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameProvider>();

    return SizedBox(
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: game.activeOrders.length,
        itemBuilder: (context, index) {
          final order = game.activeOrders[index];
          return _buildOrderCard(context, game, order);
        },
      ),
    );
  }

  Widget _buildOrderCard(BuildContext context, GameProvider game, OrderModel order) {
    bool ready = game.canCompleteOrder(order);

    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: order.isVip ? Colors.amber.shade100 : (ready ? Colors.green.shade50 : Colors.amber.shade50),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: order.isVip ? Colors.amber.shade800 : (ready ? Colors.green.shade400 : Colors.amber.shade300),
          width: order.isVip || ready ? 2 : 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(order.customerAvatar, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  order.customerName,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: order.isVip ? Colors.brown.shade900 : Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text('🪙${order.rewardCoins}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.orange)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: order.requiredItems.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Text(item.icon, style: const TextStyle(fontSize: 16)),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 24,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: ready ? (order.isVip ? Colors.amber.shade800 : Colors.green) : Colors.grey.shade400,
                foregroundColor: Colors.white,
              ),
              onPressed: ready ? () => game.completeOrder(order) : null,
              child: Text(
                ready ? (order.isVip ? '👑 VIP Сдать' : 'Отдать!') : 'Собрать',
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}