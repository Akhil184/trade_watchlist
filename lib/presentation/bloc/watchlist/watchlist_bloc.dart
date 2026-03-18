import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/stock_model.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(const WatchlistState(stocks: [])) {
    on<LoadWatchlist>(_onLoad);
    on<ReorderWatchlist>(_onReorder);
  }

  void _onLoad(LoadWatchlist event, Emitter<WatchlistState> emit) {
    final stocks = [
      const Stock(name: "RELIANCE", exchange: "NSE", price: 1374.00, change: -4.5, percentage: -0.33),
      const Stock(name: "HDFCBANK", exchange: "NSE", price: 966.85, change: 0.85, percentage: 0.09),
      const Stock(name: "ASIANPAINT", exchange: "NSE", price: 2537.40, change: 6.60, percentage: 0.26),
      const Stock(name: "NIFTY IT", exchange: "IDX", price: 35187.55, change: 877.11, percentage: 2.56),
      const Stock(name: "RELIANCE SEP 1880 CE", exchange: "NSE", price: 0.00, change: 0.00, percentage: 0.00),
      const Stock(name: "RELIANCE SEP 1370 PE", exchange: "NSE", price: 19.20, change: 1.00, percentage: 5.49),
      const Stock(name: "MRF", exchange: "NSE", price: 147625.00, change: 550.00, percentage: 0.37),
      const Stock(name: "MRF", exchange: "BSE", price: 147439.45, change: 463.80, percentage: 0.32),
    ];

    emit(state.copyWith(stocks: stocks));
  }

  void _onReorder(ReorderWatchlist event, Emitter<WatchlistState> emit) {
    final updated = List<Stock>.from(state.stocks);

    int newIndex = event.newIndex;
    if (event.oldIndex < newIndex) newIndex--;

    final item = updated.removeAt(event.oldIndex);
    updated.insert(newIndex, item);

    emit(state.copyWith(stocks: updated));
  }
}