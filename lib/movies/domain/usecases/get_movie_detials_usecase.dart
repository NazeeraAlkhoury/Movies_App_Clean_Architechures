import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie_detials.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

class GetMovieDetialsUsecase
    extends BaseUseCase<MovieDetials, DetialMoviesParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetialsUsecase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetials>> call(
      DetialMoviesParameters parameters) async {
    return await baseMoviesRepository.getMovieDetials(parameters);
  }
}

class DetialMoviesParameters extends Equatable {
  final int movieId;

  const DetialMoviesParameters({required this.movieId});

  @override
  List<Object?> get props => [
        movieId,
      ];
}
