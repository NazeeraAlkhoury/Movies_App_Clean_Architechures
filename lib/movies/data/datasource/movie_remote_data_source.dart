import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';

import 'package:movies_app/movies/data/models/movie_detial_model.dart';

import 'package:movies_app/movies/data/models/movies_model.dart';
import 'package:movies_app/movies/data/models/recommendations_moel.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detials_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MovieDetialsModel> getMovieDetials(DetialMoviesParameters parameters);
  Future<List<RecommendationsModel>> getRecommendations(
      DetialMoviesParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviePath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results']).map((e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviePath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviePath);
    // ignore: avoid_print
    //print(response);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<MovieDetialsModel> getMovieDetials(
      DetialMoviesParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetialsPath(parameters.movieId));
    //print('detials : ${response.toString()}');
    if (response.statusCode == 200) {
      return MovieDetialsModel.fromJson(response.data);
    } else {
      throw ServerException(response.data);
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(
      DetialMoviesParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.recommendationsPath(parameters.movieId));

    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationsModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(response.data);
    }
  }
}
