import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/movie/domain/entity/genres.dart';

class MovieDetails extends Equatable {
  final String title;
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final String releaseDate;
  final int runTime;
  final double voteAverage;

  const MovieDetails(
      {required this.title,
      required this.backdropPath,
      required this.id,
      required this.genres,
      required this.overview,
      required this.releaseDate,
      required this.runTime,
      required this.voteAverage});

  @override
  List<Object?> get props =>
      [backdropPath, id, overview, releaseDate, runTime, voteAverage, title];
}
