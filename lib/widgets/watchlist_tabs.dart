import 'package:flutter/material.dart';

class WatchlistTabs extends StatelessWidget {
  const WatchlistTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            _tab("Watchlist 1", true),
            SizedBox(width: 24),
            _tab("Watchlist 5", false),
            SizedBox(width: 24),
            _tab("Watchlist 6", false),
          ],
        )
    );
  }

  Widget _tab(String text, bool active) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              color: active ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          if (active)
            Container(
              height: 2,
              width: 60,
              color: Colors.black,
            ),
        ],
      ),
    );
  }
}