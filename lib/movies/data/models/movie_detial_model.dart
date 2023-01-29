import 'package:movies_app/movies/data/models/geners_model.dart';
import 'package:movies_app/movies/domain/entities/movie_detials.dart';

class MovieDetialsModel extends MovieDetials {
  const MovieDetialsModel({
    required super.id,
    required super.backdropPath,
    required super.genres,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetialsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetialsModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        genres: List<GenersModel>.from(
            json['genres'].map((x) => GenersModel.fromJson(x))),
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
