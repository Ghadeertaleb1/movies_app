part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsEvent({required this.movieId});
}

class GetRecommendMovieEvent extends MovieDetailsEvent {
  final int movieId;

  const GetRecommendMovieEvent({required this.movieId});
}
