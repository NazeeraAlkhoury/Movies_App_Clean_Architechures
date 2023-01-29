import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';

import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie_detials.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';

import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detials_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movies>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetials>> getMovieDetials(
      DetialMoviesParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetials(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendations(
      DetialMoviesParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendations(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(
        failure.errorMessageModel.statusMessage,
      ));
    }
  }
}
