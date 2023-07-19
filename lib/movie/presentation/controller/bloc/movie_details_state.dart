part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final String movieDetailsMessage;
  final RequestState movieDetailsState;
  final List<Recommendation> recommendation;
  final String movierecommendationMessage;
  final RequestState recommendationMovieState;

  const MovieDetailsState(
      {this.movierecommendationMessage = "",
      this.recommendationMovieState = RequestState.loading,
      this.recommendation = const [],
      this.movieDetails,
      this.movieDetailsMessage = "",
      this.movieDetailsState = RequestState.loading});

  MovieDetailsState copyWith({
    List<Recommendation>? recommendation,
    String? movierecommendationMessage,
    RequestState? recommendationMovieState,
    MovieDetails? movieDetails,
    String? movieDetailsMessage,
    RequestState? movieDetailsState,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendation: recommendation ?? this.recommendation,
      recommendationMovieState:
          recommendationMovieState ?? this.recommendationMovieState,
      movierecommendationMessage:
          movierecommendationMessage ?? this.movierecommendationMessage,
    );
  }

  @override
  List<Object> get props => [
        movieDetailsMessage,
        movieDetailsState,
        movierecommendationMessage,
        recommendationMovieState,
        recommendation,
      ];
}
