import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/watchlist/watchlist_bloc.dart';
import 'presentation/screens/watchlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WatchlistBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WatchlistScreen(),
      ),
    );
  }
}