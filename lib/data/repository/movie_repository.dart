import 'package:flutter_movies_app_clean_architecture/data/network/client/api_client.dart';
import 'package:flutter_movies_app_clean_architecture/data/network/network_mapper.dart';
import 'package:flutter_movies_app_clean_architecture/domain/models/movie_model.dart';

class MoviesRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;

  MoviesRepository({required this.apiClient, required this.networkMapper});

  Future<List<Movie>> getUpcomingMovies({
    required int limit,
    required int page,
  }) async {
    final UpcomingMovies = await apiClient.getUpcomingMovies(
      page: page,
      limit: limit,
    );
    return networkMapper.toMovies(UpcomingMovies.results);
  }
}
