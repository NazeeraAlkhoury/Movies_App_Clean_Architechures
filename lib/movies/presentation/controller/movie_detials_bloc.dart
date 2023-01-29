import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detials_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendatios_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_detials_event.dart';
import 'package:movies_app/movies/presentation/controller/movie_detials_state.dart';

class MovieDetialsBloc extends Bloc<MovieDetialsEvents, MovieDetialsState> {
  final GetMovieDetialsUsecase getMovieDetialsUsecase;
  final GetRecommendationsUseCase getRecommendationsUseCase;

  MovieDetialsBloc(
    this.getMovieDetialsUsecase,
    this.getRecommendationsUseCase,
  ) : super(const MovieDetialsState()) {
    on<GetMovieDetialsEvent>(_getMovieDetialsEvent);
    on<GetRecommendationEvent>(_getRecommendationEvent);
  }

  FutureOr<void> _getMovieDetialsEvent(
      GetMovieDetialsEvent event, Emitter<MovieDetialsState> emit) async {
    final result = await getMovieDetialsUsecase.call(DetialMoviesParameters(
      movieId: event.id,
    ));
    // print('Detials: $result');
    result.fold(
        (l) => emit(state.copyWith(
              errorMovieDetialsMessage: l.message,
              detialsState: RequestState.error,
            )),
        (r) => emit(state.copyWith(
              movieDetials: r,
              detialsState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getRecommendationEvent(
      GetRecommendationEvent event, Emitter<MovieDetialsState> emit) async {
    final result = await getRecommendationsUseCase.call(
      DetialMoviesParameters(movieId: event.id),
    );
    // print('recomendation: $result');
    result.fold(
      (l) => emit(
        state.copyWith(
          errorrecommendationsMessage: l.message,
          recommendationsState: RequestState.error,
        ),
      ),
      (r) => emit(state.copyWith(
        recommendationsMovie: r,
        recommendationsState: RequestState.loaded,
      )),
    );
  }
}
