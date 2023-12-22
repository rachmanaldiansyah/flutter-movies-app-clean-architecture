import 'package:json_annotation/json_annotation.dart';

part 'movies_db_entity.g.dart';

@JsonSerializable()
class MoviesDbEntity {
  static const fieldId = 'movies_id';
  static const fieldMovieId = 'movie_movie_id';
  static const fieldTitle = 'movie_title';
  static const fieldImageUrl = 'movie_image_url';
  static const fieldReleaseDate = 'movie_release_date';

  @JsonKey(name: fieldId)
  final int? id;
  @JsonKey(name: fieldMovieId)
  final String movieId;
  @JsonKey(name: fieldTitle)
  final String title;
  @JsonKey(name: fieldImageUrl)
  final String? imageUrl;
  @JsonKey(name: fieldReleaseDate)
  final int releaseDate;

  MoviesDbEntity({
    required this.id,
    required this.movieId,
    required this.title,
    this.imageUrl,
    required this.releaseDate,
  });

  factory MoviesDbEntity.fromJson(Map<String, dynamic> json) =>
      _$MoviesDbEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesDbEntityToJson(this);
}
