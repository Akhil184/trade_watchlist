import 'package:flutter/material.dart';
import '../../data/models/stock_model.dart';

class StockTile extends StatelessWidget {
  final Stock stock;

  const StockTile({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    final isPositive = stock.change >= 0;

    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFEAEAEA), width: 1),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.drag_handle, color: Colors.grey, size: 20),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stock.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${stock.exchange} | EQ",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                stock.price.toStringAsFixed(2),
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${stock.change} (${stock.percentage}%)",
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}