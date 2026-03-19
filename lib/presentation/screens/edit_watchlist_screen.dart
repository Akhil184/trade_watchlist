import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/watchlist/watchlist_bloc.dart';
import '../bloc/watchlist/watchlist_event.dart';
import '../bloc/watchlist/watchlist_state.dart';

class EditWatchlistScreen extends StatelessWidget {
  const EditWatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final textScale = MediaQuery
        .of(context)
        .textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context, screenWidth, screenHeight, textScale),
            _watchlistCard(screenWidth, screenHeight, textScale),
            Expanded(child: _buildStockList(screenWidth, screenHeight, textScale)),
            _bottomButtons(screenWidth, screenHeight, textScale),
          ],
        ),
      ),
    );
  }

  /// TOP BAR
  Widget _topBar(BuildContext context, double screenWidth, double screenHeight,
      double textScale) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03,
        vertical: screenHeight * 0.02,),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
          SizedBox(width: screenWidth * 0.03),
          Text(
            "Edit Watchlist 1",
            style: TextStyle(
              fontSize: 16 * textScale,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// 🟦 WATCHLIST CARD
  Widget _watchlistCard(double screenWidth, double screenHeight, double textScale) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03, // responsive horizontal margin
        vertical: screenHeight * 0.01,),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03, // responsive horizontal padding
        vertical: screenHeight * 0.02,),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(screenWidth * 0.025),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Watchlist 1",
            style: TextStyle(fontSize: 14 * textScale),
          ),
          Icon(Icons.edit, size: screenWidth * 0.045),
        ],
      ),
    );
  }

  /// 📋 LIST (DRAG + DELETE ONLY — NO PRICE)
  Widget _buildStockList(double screenWidth, double screenHeight, double textScale) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        return ReorderableListView.builder(
          buildDefaultDragHandles: false,
          itemCount: state.stocks.length,
          onReorder: (oldIndex, newIndex) {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }

            context.read<WatchlistBloc>().add(
              ReorderWatchlist(oldIndex, newIndex),
            );
          },
          itemBuilder: (context, index) {
            final stock = state.stocks[index];

            return Container(
              key: ValueKey("${stock.name}-$index"),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03, // responsive horizontal padding
                vertical: screenHeight * 0.02,),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFEAEAEA)),
                ),
              ),
              child: Row(
                children: [

                  /// DRAG ICON
                  ReorderableDragStartListener(
                    index: index,
                    child: Icon(
                      Icons.drag_handle,
                      size: screenWidth * 0.05,
                      color: Colors.black54,
                    ),
                  ),

                  SizedBox(width: screenWidth * 0.03),

                  /// STOCK NAME
                  Expanded(
                    child: Text(
                      stock.name,
                      style: TextStyle(
                        fontSize: 15 * textScale,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  /// DELETE ICON
                  GestureDetector(
                    onTap: () {
                      context.read<WatchlistBloc>().add(DeleteStock(index));
                    },
                    child:Icon(
                      Icons.delete,
                      size: screenWidth * 0.055,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  ///  BOTTOM BUTTONS
  Widget _bottomButtons(double screenWidth, double screenHeight,
      double textScale) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.03), // responsive padding
      child: Column(
        children: [

          /// OUTLINED BUTTON
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
            // responsive
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(
                  screenWidth * 0.03), // responsive radius
            ),
            child: Center(
              child: Text(
                "Edit other watchlists",
                style: TextStyle(fontSize: 14 * textScale), // responsive text
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.015), // responsive spacing

          /// PRIMARY BUTTON
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
            // responsive
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                  screenWidth * 0.03), // responsive radius
            ),
            child: Center(
              child: Text(
                "Save Watchlist",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15 * textScale, // responsive text
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}