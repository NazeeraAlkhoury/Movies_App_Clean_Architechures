import 'package:movies_app/movies/domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    required super.id,
    required super.backdropPath,
    required super.genreIds,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from((json['genre_ids']).map((e) => e)),
        title: json['title'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
      );
}
