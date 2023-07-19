import 'package:dartz/dartz.dart';

import '../../../core/network/failure.dart';
import '../entity/details.dart';
import '../entity/movie.dart';
import '../entity/recommendation.dart';
import '../usecase/get_movie_recommend.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, List<MovieDetails>>> getMovieDetails(int id);

  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(
      RecommendationParameter parameter);
}
