import 'package:dartz/dartz.dart';
import '../../../core/network/failure.dart';
import '../entity/details.dart';
import '../repository/base_repository.dart';

class GetMovieDetailsUsecase {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUsecase({required this.baseMoviesRepository});

  Future<Either<Failure, List<MovieDetails>>> call(int id) async {
    return await baseMoviesRepository.getMovieDetails(id);
  }
}
