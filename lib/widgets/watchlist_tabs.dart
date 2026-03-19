import 'package:flutter/material.dart';
import '../../core/utils/responsive_utils.dart';

class WatchlistTabs extends StatelessWidget {
  const WatchlistTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ResponsiveUtils.screenWidth * 0.012,
        right: ResponsiveUtils.screenWidth * 0.03,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFEAEAEA),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          _tab("Watchlist 1", true),
          SizedBox(width: ResponsiveUtils.screenWidth * 0.06),
          _tab("Watchlist 5", false),
          SizedBox(width: ResponsiveUtils.screenWidth * 0.06),
          _tab("Watchlist 6", false),
        ],
      ),
    );
  }

  Widget _tab(String text, bool active) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.screenWidth * 0.03,
      ),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              color: active ? Colors.black : Colors.grey,
              fontSize: 14 * ResponsiveUtils.textScale,
            ),
          ),
          SizedBox(height: ResponsiveUtils.screenHeight * 0.008),
          if (active)
            Container(
              height: ResponsiveUtils.screenHeight * 0.003,
              width: ResponsiveUtils.screenWidth * 0.15,
              color: Colors.black,
            ),
        ],
      ),
    );
  }
}