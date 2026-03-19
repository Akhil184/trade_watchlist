import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';
import '../../data/models/stock_model.dart';

class StockTile extends StatelessWidget {
  final Stock stock;

  const StockTile({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    final isPositive = stock.change >= 0;

    return Container(
      key: key,
      padding: EdgeInsets.only(
        left: ResponsiveUtils.screenWidth * 0.015,
        right: ResponsiveUtils.screenWidth * 0.03,
        top: ResponsiveUtils.screenHeight * 0.018,
        bottom: ResponsiveUtils.screenHeight * 0.018,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFEAEAEA), width: 1),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: ResponsiveUtils.screenWidth * 0.03),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stock.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15 * ResponsiveUtils.textScale,
                  ),
                ),
                SizedBox(height: ResponsiveUtils.screenHeight * 0.005),
                Text(
                  "${stock.exchange} | EQ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12 * ResponsiveUtils.textScale,
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
                  fontSize: 15 * ResponsiveUtils.textScale,
                ),
              ),
              SizedBox(height: ResponsiveUtils.screenHeight * 0.005),
              Text(
                "${stock.change} (${stock.percentage}%)",
                style: TextStyle(
                  color: isPositive ? Colors.green : Colors.red,
                  fontSize: 12 * ResponsiveUtils.textScale,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}