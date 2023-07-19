import 'package:flutter_application_1/movie/domain/usecase/get_movie_recommend.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enum.dart';
import '../../../domain/entity/details.dart';
import '../../../domain/entity/recommendation.dart';
import '../../../domain/usecase/get_movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUsecase movieDetailsUsecase;
  GetMovieRecommendUseCase getMovieRecommendUseCase;

  MovieDetailsBloc(
      {required this.movieDetailsUsecase,
      required this.getMovieRecommendUseCase})
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final result = await movieDetailsUsecase(event.movieId);

      return result.fold(
          (l) => emit(state.copyWith(
                movieDetailsMessage: state.movieDetailsMessage,
                movieDetailsState: RequestState.error,
              )),
          (r) => emit(state.copyWith(
              movieDetails: r.isNotEmpty ? r.first : null,
              movieDetailsState: RequestState.loaded)));
    });
    on<GetRecommendMovieEvent>((event, emit) async {
      final result = await getMovieRecommendUseCase(
          RecommendationParameter(id: event.movieId));

      return result.fold(
          (l) => emit(state.copyWith(
                movieDetailsMessage: state.movierecommendationMessage,
                movieDetailsState: RequestState.error,
              )),
          (r) => emit(state.copyWith(
              recommendation: r,
              recommendationMovieState: RequestState.loaded)));
    });
  }
}
