import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detials.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';

class MovieDetialsState extends Equatable {
  final MovieDetials? movieDetials;
  final String errorMovieDetialsMessage;
  final RequestState detialsState;

  final List<Recommendations> recommendationsMovie;
  final String errorrecommendationsMessage;
  final RequestState recommendationsState;

  const MovieDetialsState({
    this.movieDetials,
    this.errorMovieDetialsMessage = '',
    this.detialsState = RequestState.loading,
    this.recommendationsMovie = const [],
    this.errorrecommendationsMessage = '',
    this.recommendationsState = RequestState.loading,
  });

  MovieDetialsState copyWith({
    MovieDetials? movieDetials,
    String? errorMovieDetialsMessage,
    RequestState? detialsState,
    List<Recommendations>? recommendationsMovie,
    String? errorrecommendationsMessage,
    RequestState? recommendationsState,
  }) =>
      MovieDetialsState(
        movieDetials: movieDetials ?? this.movieDetials,
        detialsState: detialsState ?? this.detialsState,
        errorMovieDetialsMessage:
            errorMovieDetialsMessage ?? this.errorMovieDetialsMessage,
        recommendationsMovie: recommendationsMovie ?? this.recommendationsMovie,
        recommendationsState: recommendationsState ?? this.recommendationsState,
        errorrecommendationsMessage:
            errorrecommendationsMessage ?? this.errorrecommendationsMessage,
      );

  @override
  List<Object?> get props => [
        movieDetials,
        errorMovieDetialsMessage,
        detialsState,
        recommendationsMovie,
        errorrecommendationsMessage,
        recommendationsState,
      ];
}
