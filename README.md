# Watchlist Reordering (Flutter)

This project implements a watchlist feature where users can view and reorder stocks, similar to the reference video provided in the assignment. The main focus is on drag-and-drop reordering using the BLoC architecture, with a clean and responsive UI.

## Features

- Drag-and-drop reordering of stocks in a watchlist
- Two screens:
    - WatchlistScreen – main watchlist overview (read-only)
    - EditWatchlistScreen – reorderable watchlist with drag handles
- BLoC pattern used for state management
- UI designed to closely match the reference video
- Responsive layout suitable for different screen sizes
- Sample stock data included for demonstration

## Approach

The main requirement was to implement reordering using BLoC while maintaining clean state management:

1. The stock list is stored in the BLoC state.
2. When a user drags an item, a `ReorderWatchlist` event is triggered.
3. The BLoC updates the list by removing and inserting the item at the new index.
4. The updated state is emitted, automatically rebuilding the UI.
5. `ReorderableListView` is used to handle drag interactions.
6. Changes made in EditWatchlistScreen are reflected immediately in WatchlistScreen through the BLoC state.

Optional enhancement:

- Users can also delete stocks from the watchlist using the delete icon in the edit screen.

## Project Structure

lib/
│
├── data/
│   └── models/
│       └── stock_model.dart         # Defines the Stock model
│
├── presentation/
│   ├── bloc/
│   │   └── watchlist/
│   │       ├── watchlist_bloc.dart   # BLoC class for watchlist
│   │       ├── watchlist_event.dart  # Watchlist events (load, reorder, delete)
│   │       └── watchlist_state.dart  # State representation of the watchlist
│   │
│   ├── screens/
│   │   ├── watchlist_screen.dart      # Main watchlist overview screen
│   │   └── edit_watchlist_screen.dart # Reorderable watchlist screen
│   │
│   └──widgets/
│       ├── stock_tile.dart           # Reusable stock row widget
│       ├── watchlist_tabs.dart       # Tabs for categories
│       ├── search_bar.dart           # Search bar widget
│       └── sort_button.dart          # Sort button widget
│
└── main.dart                          # Entry point and BlocProvider setup

## How to Run

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Launch the app using `flutter run`.

## Notes

- Reordering is handled entirely via BLoC; 
- Drag icon (handles) are shown only in EditWatchlistScreen, as in the reference video.
- The layout uses Expanded, Column, and Row to ensure responsiveness across devices.
- MediaQuery is used throughout the application to dynamically adapt padding, spacing, and font sizes based on screen width, height, and text scale factor, ensuring a consistent UI across different screen sizes.