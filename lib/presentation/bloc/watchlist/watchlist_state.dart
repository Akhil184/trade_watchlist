import '../../../data/models/stock_model.dart';

class WatchlistState {
  final List<Stock> stocks;

  const WatchlistState({required this.stocks});

  WatchlistState copyWith({List<Stock>? stocks}) {
    return WatchlistState(
      stocks: stocks ?? this.stocks,
    );
  }
}