import 'package:flutter_movies_app_clean_architecture/data/repository/movie_repository.dart';
import 'package:flutter_movies_app_clean_architecture/domain/models/movie_model.dart';
import 'package:logger/logger.dart';

class MoviesListModel {
  final Logger log;
  final MoviesRepository moviesRepository;

  MoviesListModel({
    required this.log,
    required this.moviesRepository,
  });

  Future<List<Movie>> fetchPage(int page) async {
    try {
      return await moviesRepository.getUpcomingMovies(limit: 10, page: page);
    } catch (e) {
      log.e('Error saat mengambil data halaman $page', error: e);
      rethrow;
    }
  }

  Future<void> deletePersistedMovies() async {
    try {
      await moviesRepository.deleteAll();
    } catch (e) {
      log.e('Error when deleting movies', error: e);
      rethrow;
    }
  }

  Future<bool> hasNewData() async {
    try {
      return await moviesRepository.checkNewData();
    } catch (e) {
      log.e('Error when checking for new data', error: e);
      return true;
    }
  }
}
