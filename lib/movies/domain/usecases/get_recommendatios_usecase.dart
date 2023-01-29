import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detials_usecase.dart';

class GetRecommendationsUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationsUseCase(this.baseMoviesRepository);

  Future<Either<Failure, List<Recommendations>>> call(
      DetialMoviesParameters parameters) async {
    return await baseMoviesRepository.getRecommendations(parameters);
  }
}
