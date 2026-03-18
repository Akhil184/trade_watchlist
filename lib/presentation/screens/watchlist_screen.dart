import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/search_bar.dart';
import '../../widgets/sort_button.dart';
import '../../widgets/stock_tile.dart';
import '../../widgets/watchlist_tabs.dart';
import '../bloc/watchlist/watchlist_bloc.dart';
import '../bloc/watchlist/watchlist_event.dart';
import '../bloc/watchlist/watchlist_state.dart';
import 'edit_watchlist_screen.dart';


class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {

  @override
  void initState() {
    super.initState();
    context.read<WatchlistBloc>().add(LoadWatchlist());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _topMarketBar(context),
            const SearchBarWidget(),
            const WatchlistTabs(),
            const SortButton(),
            _buildWatchlist()
          ],
        ),
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }
}

Widget _topMarketBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    child: IntrinsicHeight( // 🔥 important for divider height
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // 🔥 center align
        children: [
          /// LEFT SIDE (SENSEX)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: const [
                    Text(
                      "SENSEX 18TH SEP",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "BSE",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      "1,225.55",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "+144.50 (13.3%)",
                      style: TextStyle(
                          color: Colors.green.shade700, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// 🔥 DIVIDER
          Container(
            width: 1,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.grey.shade300,
          ),

          /// RIGHT SIDE (NIFTY)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// NIFTY TEXT
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center, // 🔥 center align
                  children: [
                    const Text(
                      "NIFTY BANK",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          "54,172.85",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "-14.05 (-0.03%)",
                          style: TextStyle(
                              color: Colors.red.shade700, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),

                /// ARROW
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EditWatchlistScreen(),
                      ),
                    );
                  },
                  child: const Icon(Icons.chevron_right, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildWatchlist() {
  return Expanded(
    child: BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        return ReorderableListView.builder(
          padding: EdgeInsets.zero,
          itemCount: state.stocks.length,
          onReorder: (oldIndex, newIndex) {
            context.read<WatchlistBloc>().add(
              ReorderWatchlist(oldIndex, newIndex),
            );
          },
          itemBuilder: (context, index) {
            final stock = state.stocks[index];

            return StockTile(
              key: ValueKey("$index-${stock.name}"),
              stock: stock,
            );
          },
        );
      },
    ),
  );
}

Widget _bottomNav() {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: "Watchlist"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Orders"),
      BottomNavigationBarItem(icon: Icon(Icons.flash_on_outlined), label: "GTT+"),
      BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "Portfolio"),
      BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: "Funds"),
      BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
    ],
  );
}
