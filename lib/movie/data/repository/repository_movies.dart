import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/network/exception.dart';
import 'package:flutter_application_1/core/network/internet_info.dart';
import 'package:flutter_application_1/movie/domain/entity/details.dart';
import 'package:flutter_application_1/movie/domain/entity/movie.dart';
import 'package:flutter_application_1/movie/domain/entity/recommendation.dart';
import 'package:flutter_application_1/movie/domain/repository/base_repository.dart';
import 'package:flutter_application_1/movie/domain/usecase/get_movie_recommend.dart';
import '../../../core/network/failure.dart';
import '../data-source/movie_remote_data_source copy.dart';

import '../model/movie_model.dart';

typedef SelectMoviesRepositoryFunction = Future<List<MovieModel>> Function();

class MoviesRepository extends BaseMoviesRepository {
  BaseRemoteDataSource baseRemoteDataSource;
  BaseNetworkInfo baseNetworkInfo;
  MoviesRepository(
      {required this.baseRemoteDataSource, required this.baseNetworkInfo});
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    return _moviesResult(
      () {
        return baseRemoteDataSource.getNowPlayingMovies();
      },
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    return _moviesResult(
      () {
        return baseRemoteDataSource.getPopularMovies();
      },
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    return _moviesResult(
      () {
        return baseRemoteDataSource.getTopRatedMovies();
      },
    );
  }

  @override
  Future<Either<Failure, List<MovieDetails>>> getMovieDetails(int id) async {
    if (await baseNetworkInfo.isConnected) {
      try {
        final result = await baseRemoteDataSource.getMovieDetails(id);
        return right([result]);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.errorModel.statusMessage));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  Future<Either<Failure, List<Movie>>> _moviesResult(
      SelectMoviesRepositoryFunction selectMoviesRepositoryFunction) async {
    if (await baseNetworkInfo.isConnected) {
      try {
        final result = await selectMoviesRepositoryFunction();
        return right(result);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.errorModel.statusMessage));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(
      RecommendationParameter parameter) async {
    if (await baseNetworkInfo.isConnected) {
      try {
        final result =
            await baseRemoteDataSource.getRecommendationMovies(parameter);
        return right(result);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.errorModel.statusMessage));
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
