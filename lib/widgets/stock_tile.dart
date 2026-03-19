import 'package:flutter/material.dart';
import '../../data/models/stock_model.dart';

class StockTile extends StatelessWidget {
  final Stock stock;

  const StockTile({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;
    final isPositive = stock.change >= 0;

    return Container(
      key: key,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenHeight * 0.018,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFEAEAEA), width: 1),
        ),
      ),
      child: Row(
        children: [

          SizedBox(width: screenWidth * 0.03), // responsive spacing

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stock.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15 * textScale, // responsive text
                  ),
                ),
                SizedBox(height: screenHeight * 0.005), // responsive spacing
                Text(
                  "${stock.exchange} | EQ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12 * textScale, // responsive text
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
                  fontSize: 15 * textScale, // responsive text
                ),
              ),
              SizedBox(height: screenHeight * 0.005), // responsive spacing
              Text(
                "${stock.change} (${stock.percentage}%)",
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontSize: 12 * textScale, // responsive text
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}