import 'package:flutter/material.dart';
import 'package:flutter_movies_app_clean_architecture/main.dart';
import 'package:flutter_movies_app_clean_architecture/presentation/list/movies_list_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final InitialData data;

  const App({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: data.providers,
      child: MaterialApp(
        title: 'Movies App',
        home: MoviesListScreen(),
      ),
    );
  }
}
