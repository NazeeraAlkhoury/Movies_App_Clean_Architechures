import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detials_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendatios_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_detials_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // remote Datasource
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    //  repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    //  usecase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(sl()));

    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));

    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));

    sl.registerLazySingleton(() => GetMovieDetialsUsecase(sl()));

    sl.registerLazySingleton(() => GetRecommendationsUseCase(sl()));

    // Bloc

    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    sl.registerFactory(() => MovieDetialsBloc(sl(), sl()));
  }
}
