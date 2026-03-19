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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _topMarketBar(context,screenWidth, screenHeight, textScale),
            SearchBarWidget(),
            WatchlistTabs(),
            SortButton(),
            _buildWatchlist()
          ],
        ),
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }
}

Widget _topMarketBar(
    BuildContext context, double screenWidth, double screenHeight, double textScale) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.03,
      vertical: screenHeight * 0.015,
    ),
    child: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// LEFT SIDE (SENSEX)
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "SENSEX 18TH SEP",
                        style: TextStyle(fontSize: 12 * textScale),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.015),
                    Flexible(
                      child: Text(
                        "BSE",
                        style: TextStyle(
                            fontSize: 12 * textScale, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "1,225.55",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15 * textScale),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.015),
                    Flexible(
                      child: Text(
                        "+144.50 (13.3%)",
                        style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 12 * textScale),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// DIVIDER
          Container(
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            color: Colors.grey.shade300,
          ),

          /// RIGHT SIDE (NIFTY)
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// NIFTY TEXT
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "NIFTY BANK",
                        style: TextStyle(fontSize: 12 * textScale),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: screenHeight * 0.012),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              "54,172.85",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15 * textScale),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Flexible(
                            child: Text(
                              "-14.05 (-0.03%)",
                              style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 12 * textScale),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// ARROW
                SizedBox(
                  width: screenWidth * 0.08, // fixed width for gesture
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EditWatchlistScreen(),
                        ),
                      );
                    },
                    child: Icon(Icons.chevron_right, size: screenWidth * 0.05),
                  ),
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
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: state.stocks.length,
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
