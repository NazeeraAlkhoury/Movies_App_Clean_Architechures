import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';

import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUsecase.call(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
              errorMessagepopularMovies: l.message,
              popularMoviesrequestState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              popularMovies: r,
              popularMoviesrequestState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUsecase.call(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
            errorMessagetopRatedMovies: l.message,
            topRatedMoviesrequestState: RequestState.error)),
        (r) => emit(state.copyWith(
              topRatedMovies: r,
              topRatedMoviesrequestState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    // Step 3
    // BaseMovieRemoteDataSource baseMovieRemoteDataSource =
    //     MovieRemoteDataSource();
    // print(baseMovieRemoteDataSource.hashCode);
    // BaseMoviesRepository baseMoviesRepository =
    //     MoviesRepository(baseMovieRemoteDataSource);
    // print(baseMoviesRepository.hashCode);
    // ignore: unused_local_variable
    final result = await getNowPlayingMoviesUsecase.call(const NoParameter());
    // emit(const MoviesState(
    //   nowPlayingrequestState: RequestState.loaded,
    // ));
    // ignore: avoid_print
    // print(state);

    // ignore: avoid_print
    // print(result);

    // step 3

    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingrequestState: RequestState.error,
          errorMessageNowPlayingMovies: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingrequestState: RequestState.loaded,
          nowPlayingMovies: r,
        ),
      ),
    );
  }
}
