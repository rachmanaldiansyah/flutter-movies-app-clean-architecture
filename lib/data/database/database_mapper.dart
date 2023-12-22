import 'package:flutter_movies_app_clean_architecture/data/database/entity/movies_db_entity.dart';
import 'package:flutter_movies_app_clean_architecture/domain/exceptions/exception_mapper.dart';
import 'package:flutter_movies_app_clean_architecture/domain/models/movie_model.dart';
import 'package:logger/logger.dart';

class DatabaseMapper {
  final Logger log;

  DatabaseMapper({required this.log});

  Movie toMovie(MoviesDbEntity entity) {
    try {
      return Movie(
        id: entity.movieId,
        title: entity.title,
        imageUrl: entity.imageUrl,
        releaseDate: DateTime.fromMillisecondsSinceEpoch(entity.releaseDate),
      );
    } catch (e) {
      throw ExceptionMapper<MoviesDbEntity, Movie>(e.toString());
    }
  }

  List<Movie> toMovies(List<MoviesDbEntity> entities) {
    final List<Movie> movies = [];

    for (final entity in entities) {
      try {
        movies.add(toMovie(entity));
      } catch (e) {
        log.w('Could not map entity ${entity.movieId}', error: e);
      }
    }

    return movies;
  }

  MoviesDbEntity toMoviesDbEntity(Movie movie) {
    try {
      return MoviesDbEntity(
        id: null,
        movieId: movie.id,
        title: movie.title,
        imageUrl: movie.imageUrl,
        releaseDate: movie.releaseDate.millisecondsSinceEpoch,
      );
    } catch (e) {
      throw ExceptionMapper<Movie, MoviesDbEntity>(e.toString());
    }
  }

  List<MoviesDbEntity> toMovieDbEntities(List<Movie> movies) {
    final List<MoviesDbEntity> entities = [];

    for (final movie in movies) {
      try {
        entities.add(toMoviesDbEntity(movie));
      } catch (e) {
        log.w('Could not map movie ${movie.id}', error: e);
      }
    }

    return entities;
  }
}
