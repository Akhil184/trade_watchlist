import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/responsive_utils.dart';
import '../bloc/watchlist/watchlist_bloc.dart';
import '../bloc/watchlist/watchlist_event.dart';
import '../bloc/watchlist/watchlist_state.dart';

class EditWatchlistScreen extends StatelessWidget {
  const EditWatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context),
            _watchlistCard(),
            Expanded(
              child: _buildStockList(),
            ),
            _bottomButtons(),
          ],
        ),
      ),
    );
  }

  /// TOP BAR
  Widget _topBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.screenWidth * 0.03,
        vertical: ResponsiveUtils.screenHeight * 0.02,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
          SizedBox(width: ResponsiveUtils.screenWidth * 0.03),
          Text(
            "Edit Watchlist 1",
            style: TextStyle(
              fontSize: 16 * ResponsiveUtils.textScale,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// WATCHLIST CARD
  Widget _watchlistCard() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.screenWidth * 0.03,
        vertical: ResponsiveUtils.screenHeight * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.screenWidth * 0.03,
        vertical: ResponsiveUtils.screenHeight * 0.02,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.screenWidth * 0.025,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Watchlist 1",
            style: TextStyle(fontSize: 14 * ResponsiveUtils.textScale),
          ),
          Icon(
            Icons.edit,
            size: ResponsiveUtils.screenWidth * 0.045,
          ),
        ],
      ),
    );
  }

  /// LIST
  Widget _buildStockList() {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      builder: (context, state) {
        return ReorderableListView.builder(
          buildDefaultDragHandles: false,
          itemCount: state.stocks.length,
          onReorder: (oldIndex, newIndex) {
            if (newIndex > oldIndex) newIndex -= 1;

            context.read<WatchlistBloc>().add(
              ReorderWatchlist(oldIndex, newIndex),
            );
          },
          itemBuilder: (context, index) {
            final stock = state.stocks[index];

            return Container(
              key: ValueKey("${stock.name}-$index"),
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveUtils.screenWidth * 0.03,
                vertical: ResponsiveUtils.screenHeight * 0.02,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFEAEAEA)),
                ),
              ),
              child: Row(
                children: [
                  ReorderableDragStartListener(
                    index: index,
                    child: Icon(
                      Icons.drag_handle,
                      size: ResponsiveUtils.screenWidth * 0.05,
                      color: Colors.black54,
                    ),
                  ),

                  SizedBox(width: ResponsiveUtils.screenWidth * 0.03),

                  Expanded(
                    child: Text(
                      stock.name,
                      style: TextStyle(
                        fontSize: 15 * ResponsiveUtils.textScale,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      context.read<WatchlistBloc>().add(DeleteStock(index));
                    },
                    child: Icon(
                      Icons.delete,
                      size: ResponsiveUtils.screenWidth * 0.055,
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

  /// BOTTOM BUTTONS
  Widget _bottomButtons() {
    return Container(
      padding: EdgeInsets.all(ResponsiveUtils.screenWidth * 0.03),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveUtils.screenHeight * 0.018,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(
                ResponsiveUtils.screenWidth * 0.03,
              ),
            ),
            child: Center(
              child: Text(
                "Edit other watchlists",
                style: TextStyle(
                  fontSize: 14 * ResponsiveUtils.textScale,
                ),
              ),
            ),
          ),

          SizedBox(height: ResponsiveUtils.screenHeight * 0.015),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveUtils.screenHeight * 0.018,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(
                ResponsiveUtils.screenWidth * 0.03,
              ),
            ),
            child: Center(
              child: Text(
                "Save Watchlist",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15 * ResponsiveUtils.textScale,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}