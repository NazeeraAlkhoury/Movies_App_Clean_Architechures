import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';

import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

class GetPopularMoviesUsecase extends BaseUseCase<List<Movies>, NoParameter> {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUsecase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movies>>> call(NoParameter parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
