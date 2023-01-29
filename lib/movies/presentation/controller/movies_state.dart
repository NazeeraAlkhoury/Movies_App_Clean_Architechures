import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final String errorMessageNowPlayingMovies;
  final RequestState nowPlayingrequestState;

  final List<Movies> popularMovies;
  final String errorMessagepopularMovies;
  final RequestState popularMoviesrequestState;

  final List<Movies> topRatedMovies;
  final String errorMessagetopRatedMovies;
  final RequestState topRatedMoviesrequestState;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.errorMessageNowPlayingMovies = '',
    this.nowPlayingrequestState = RequestState.loading,
    this.popularMovies = const [],
    this.errorMessagepopularMovies = '',
    this.popularMoviesrequestState = RequestState.loading,
    this.topRatedMovies = const [],
    this.errorMessagetopRatedMovies = '',
    this.topRatedMoviesrequestState = RequestState.loading,
  });

  MoviesState copyWith({
    List<Movies>? nowPlayingMovies,
    String? errorMessageNowPlayingMovies,
    RequestState? nowPlayingrequestState,
    List<Movies>? popularMovies,
    String? errorMessagepopularMovies,
    RequestState? popularMoviesrequestState,
    List<Movies>? topRatedMovies,
    String? errorMessagetopRatedMovies,
    RequestState? topRatedMoviesrequestState,
  }) =>
      MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        errorMessageNowPlayingMovies:
            errorMessageNowPlayingMovies ?? this.errorMessageNowPlayingMovies,
        nowPlayingrequestState:
            nowPlayingrequestState ?? this.nowPlayingrequestState,
        popularMovies: popularMovies ?? this.popularMovies,
        errorMessagepopularMovies:
            errorMessagepopularMovies ?? this.errorMessagepopularMovies,
        popularMoviesrequestState:
            popularMoviesrequestState ?? this.popularMoviesrequestState,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        errorMessagetopRatedMovies:
            errorMessagetopRatedMovies ?? this.errorMessagetopRatedMovies,
        topRatedMoviesrequestState:
            topRatedMoviesrequestState ?? this.topRatedMoviesrequestState,
      );

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        errorMessageNowPlayingMovies,
        nowPlayingrequestState,
        popularMovies,
        errorMessagepopularMovies,
        popularMoviesrequestState,
        topRatedMovies,
        errorMessagetopRatedMovies,
        topRatedMoviesrequestState,
      ];
}
