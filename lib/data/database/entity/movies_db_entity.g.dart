// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_db_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesDbEntity _$MoviesDbEntityFromJson(Map<String, dynamic> json) =>
    MoviesDbEntity(
      id: json['movies_id'] as int?,
      movieId: json['movie_movie_id'] as String,
      title: json['movie_title'] as String,
      imageUrl: json['movie_image_url'] as String?,
      releaseDate: json['movie_release_date'] as int,
    );

Map<String, dynamic> _$MoviesDbEntityToJson(MoviesDbEntity instance) =>
    <String, dynamic>{
      'movies_id': instance.id,
      'movie_movie_id': instance.movieId,
      'movie_title': instance.title,
      'movie_image_url': instance.imageUrl,
      'movie_release_date': instance.releaseDate,
    };
