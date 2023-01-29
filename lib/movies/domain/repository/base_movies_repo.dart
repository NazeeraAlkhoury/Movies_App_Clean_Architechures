import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_detials.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detials_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movies>>> getPopularMovies();
  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetials>> getMovieDetials(
      DetialMoviesParameters parameters);

  Future<Either<Failure, List<Recommendations>>> getRecommendations(
      DetialMoviesParameters parameters);
}
