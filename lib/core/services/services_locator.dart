import 'package:flutter_application_1/core/network/internet_info.dart';
import 'package:flutter_application_1/movie/domain/usecase/get_movie_recommend.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../movie/data/data-source/movie_remote_data_source copy.dart';

import '../../movie/data/repository/repository_movies.dart';
import '../../movie/domain/repository/base_repository.dart';
import '../../movie/domain/usecase/get_movie_details.dart';
import '../../movie/domain/usecase/get_now_playing_movies.dart';
import '../../movie/domain/usecase/get_popular.dart';
import '../../movie/domain/usecase/get_top_reated_movies.dart';
import '../../movie/presentation/controller/bloc/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicLocator {
  void init() {
    // Bloc
    sl.registerFactory(
      () => MoviesBloc(
          getNowPlayingMoviesUseCase: sl(),
          getPopularMoviesUseCase: sl(),
          getTopRatedMoviesUseCase: sl()),
    );
    sl.registerFactory(
      () => MovieDetailsBloc(
          movieDetailsUsecase: sl(), getMovieRecommendUseCase: sl()),
    );

    //DataSource
    sl.registerLazySingleton<BaseRemoteDataSource>(() => DioRemoteDataSource());

    //UseCase
    sl.registerLazySingleton(
        () => GetTopRatedMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetPopularMoviesUseCase(baseMoviesRepository: sl()));

    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUseCase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetMovieDetailsUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(
        () => GetMovieRecommendUseCase(baseMoviesRepository: sl()));
    // Repository

    sl.registerLazySingleton<BaseMoviesRepository>(() =>
        MoviesRepository(baseRemoteDataSource: sl(), baseNetworkInfo: sl()));

    //NetWork

    sl.registerLazySingleton<BaseNetworkInfo>(
        () => NetworkInfo(internetConnectionChecker: sl()));

    // External

    sl.registerLazySingleton(() => InternetConnectionChecker());
  }
}
