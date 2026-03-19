import 'package:flutter/material.dart';

class WatchlistTabs extends StatelessWidget {
  const WatchlistTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Container(
      padding: EdgeInsets.only(
        left: screenWidth * 0.012,  // 🔽 reduced
        right: screenWidth * 0.03,
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
          _tab("Watchlist 1", true, screenWidth, screenHeight, textScale),
          SizedBox(width: screenWidth * 0.06), // responsive spacing
          _tab("Watchlist 5", false, screenWidth, screenHeight, textScale),
          SizedBox(width: screenWidth * 0.06),
          _tab("Watchlist 6", false, screenWidth, screenHeight, textScale),
        ],
      ),
    );
  }

  Widget _tab(String text, bool active, double screenWidth, double screenHeight, double textScale) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              color: active ? Colors.black : Colors.grey,
              fontSize: 14 * textScale, // responsive text
            ),
          ),
          SizedBox(height: screenHeight * 0.008), // responsive spacing
          if (active)
            Container(
              height: screenHeight * 0.003,   // responsive height
              width: screenWidth * 0.15,      // responsive width
              color: Colors.black,
            ),
        ],
      ),
    );
  }
}