# Watchlist Reordering (Flutter)

This project implements a watchlist screen where stocks can be reordered by dragging and dropping, similar to the reference provided.

## What is implemented

- Drag and drop reordering of stocks
- BLoC used for handling state changes
- UI structured to closely match the given design
- Basic sample data for stocks

## Approach

The main requirement was to allow reordering using BLoC, so I kept the implementation focused on that.

- The stock list is stored in the BLoC state
- When a user drags an item, a `ReorderWatchlist` event is triggered
- Inside the BLoC, the list is updated by removing and inserting the item at the new index
- The updated state is emitted and the UI rebuilds automatically

I used `ReorderableListView` for handling the drag interaction.

## Project Structure
