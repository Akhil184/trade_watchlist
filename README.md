# Watchlist Reordering (Flutter)

This is a simple watchlist feature where users can view and reorder stocks. I tried to match the behavior from the reference video, mainly the drag and drop part, using BLoC.

## Features

- View list of stocks
- Reorder items using drag and drop
- Separate screen to edit order
- BLoC for state management
- Basic responsive UI
- Sample data added

## Screens

- WatchlistScreen – shows the list normally
- EditWatchlistScreen – used for reordering with drag handles

## Approach

The list is stored inside the BLoC.

When an item is dragged, a reorder event is triggered. The BLoC updates the list by moving the item and emits a new state. UI rebuilds automatically after that.

Used ReorderableListView for drag and drop.

Reordering is only enabled in the edit screen so the main screen stays simple.

Also added an option to delete items in the edit screen.

## Project Structure

lib/

├── core/
│   └── utils/
│       └── responsive_utils.dart   // handles screen sizes

├── data/
│   └── models/
│       └── stock_model.dart

├── presentation/
│   ├── bloc/
│   │   └── watchlist/
│   │       ├── watchlist_bloc.dart
│   │       ├── watchlist_event.dart
│   │       └── watchlist_state.dart
│   │
│   ├── screens/
│   │   ├── watchlist_screen.dart
│   │   └── edit_watchlist_screen.dart

├── widgets/
│   ├── stock_tile.dart
│   ├── watchlist_tabs.dart
│   ├── search_bar.dart
│   └── sort_button.dart

└── main.dart

## How to run

1. Clone the repo
2. Run flutter pub get
3. Run flutter run

## Notes

- Reordering handled in BLoC
- Drag handles only in edit screen
- Used Row, Column, Expanded for layout
- Added small helper to avoid repeating MediaQuery  