import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_application_1/movie/domain/repository/base_repository.dart';

import '../../../core/network/failure.dart';

import '../entity/recommendation.dart';

class GetMovieRecommendUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  const GetMovieRecommendUseCase({required this.baseMoviesRepository});

  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameter parameter) async {
    return await baseMoviesRepository.getMovieRecommendation(parameter);
  }
}

class RecommendationParameter extends Equatable {
  final int id;

  const RecommendationParameter({required this.id});

  @override
  List<Object?> get props => [id];
}
