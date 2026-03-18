import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            Expanded(child: _buildStockList()),
            _bottomButtons(),
          ],
        ),
      ),
    );
  }

  /// TOP BAR
  Widget _topBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 12),
          const Text(
            "Edit Watchlist 1",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// 🟦 WATCHLIST CARD
  Widget _watchlistCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Watchlist 1",
            style: TextStyle(fontSize: 14),
          ),
          Icon(Icons.edit, size: 18),
        ],
      ),
    );
  }

  /// 📋 LIST (DRAG + DELETE ONLY — NO PRICE)
  Widget _buildStockList() {
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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
                    child: const Icon(
                      Icons.drag_handle,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// STOCK NAME
                  Expanded(
                    child: Text(
                      stock.name,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  /// DELETE ICON
                  GestureDetector(
                    onTap: () {
                      context.read<WatchlistBloc>().add(DeleteStock(index));
                    },
                    child: const Icon(
                      Icons.delete,
                      size: 22,
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
  Widget _bottomButtons() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          /// OUTLINED BUTTON
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "Edit other watchlists",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// PRIMARY BUTTON
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "Save Watchlist",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}