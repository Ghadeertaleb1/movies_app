import 'package:dartz/dartz.dart';

import '../../../core/network/failure.dart';
import '../entity/movie.dart';
import '../repository/base_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase({required this.baseMoviesRepository});

  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}

// 
// GetNowPlayingMoviesUseCase();