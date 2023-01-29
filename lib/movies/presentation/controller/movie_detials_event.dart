import 'package:equatable/equatable.dart';

abstract class MovieDetialsEvents extends Equatable {
  const MovieDetialsEvents();
}

class GetMovieDetialsEvent extends MovieDetialsEvents {
  final int id;

  const GetMovieDetialsEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class GetRecommendationEvent extends MovieDetialsEvents {
  final int id;

  const GetRecommendationEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
