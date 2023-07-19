import 'package:flutter_application_1/core/utils/enum.dart';
import 'package:flutter_application_1/movie/domain/usecase/get_popular.dart';
import 'package:flutter_application_1/movie/domain/usecase/get_top_reated_movies.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_event.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/get_now_playing_movies.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
      {required this.getNowPlayingMoviesUseCase,
      required this.getPopularMoviesUseCase,
      required this.getTopRatedMoviesUseCase})
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase();

      result.fold(
          (l) => emit(state.copyWith(
              nowPlayingMoviesState: RequestState.error,
              nowPlayingMessage: state.nowPlayingMessage)), (r) {
        emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingMoviesState: RequestState.loaded));
      });
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase();

      result.fold(
          (l) => emit(state.copyWith(
              popularMoviesState: RequestState.error,
              popularMoviesMessage: state.popularMoviesMessage)), (r) {
        emit(state.copyWith(
            popularMovies: r, popularMoviesState: RequestState.loaded));
      });
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase();
      print("---------------$result");
      result.fold(
          (l) => emit(state.copyWith(
              topRatedMoviesState: RequestState.error,
              topRatedMessage: state.topRatedMessage)), (r) {
        emit(state.copyWith(
            topRatedMovies: r, topRatedMoviesState: RequestState.loaded));
      });
    });
  }
}
