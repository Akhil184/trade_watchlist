abstract class WatchlistEvent {}

class LoadWatchlist extends WatchlistEvent {}

class ReorderWatchlist extends WatchlistEvent {
  final int oldIndex;
  final int newIndex;

  ReorderWatchlist(this.oldIndex, this.newIndex);
}

/// 🗑 ADD THIS
class DeleteStock extends WatchlistEvent {
  final int index;

  DeleteStock(this.index);
}