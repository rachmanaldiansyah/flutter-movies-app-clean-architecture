import 'package:flutter_movies_app_clean_architecture/data/network/entity/movie_entity.dart';
import 'package:flutter_movies_app_clean_architecture/domain/exceptions/exception_mapper.dart';
import 'package:flutter_movies_app_clean_architecture/domain/models/movie_model.dart';
import 'package:logger/logger.dart';

class NetworkMapper {
  final Logger log;

  NetworkMapper({required this.log});

  Movie toMovie(MovieEntity entity) {
    try {
      return Movie(
        id: entity.id,
        title: entity.titleText.text,
        imageUrl: entity.primaryImage!.url,
        releaseDate: DateTime(
          entity.releaseDate.year,
          entity.releaseDate.month,
          entity.releaseDate.day,
        ),
      );
    } catch (e) {
      throw ExceptionMapper<MovieEntity, Movie>(e.toString());
    }
  }

  List<Movie> toMovies(List<MovieEntity> entities) {
    final List<Movie> movies = [];

    for (final entity in entities) {
      try {
        movies.add(toMovie(entity));
      } catch (e) {
        log.w('Could not map entity ${entity.id}', error: e);
      }
    }

    return movies;
  }
}
