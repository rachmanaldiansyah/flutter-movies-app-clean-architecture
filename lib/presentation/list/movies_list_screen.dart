import 'package:flutter/material.dart';
import 'package:flutter_movies_app_clean_architecture/data/repository/movie_repository.dart';
import 'package:flutter_movies_app_clean_architecture/domain/models/movie_model.dart';
import 'package:flutter_movies_app_clean_architecture/presentation/list/movies_list_model.dart';
import 'package:flutter_movies_app_clean_architecture/presentation/list/movies_preview.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  late final MoviesListModel _model;
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _model = MoviesListModel(
      log: Provider.of<Logger>(context, listen: false),
      moviesRepository: Provider.of<MoviesRepository>(context, listen: false),
    );

    _pagingController.addPageRequestListener((pageKey) async {
      try {
        final movies = await _model.fetchPage(pageKey);
        _pagingController.appendPage(movies, pageKey + 1);
      } catch (e) {
        _pagingController.error = e;
      }
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Movies'),
      ),
      body: PagedListView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Movie>(
          itemBuilder: (context, movie, index) => Container(
            padding: const EdgeInsets.only(
              left: 12.0,
              top: 6.0,
              right: 12.0,
              bottom: 6.0,
            ),
            child: MoviesPreview(
              movie: movie,
            ),
          ),
        ),
      ),
    );
  }
}
