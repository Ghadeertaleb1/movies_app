import 'package:flutter_application_1/movie/data/model/geners_model.dart';
import 'package:flutter_application_1/movie/domain/entity/details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.genres,
      required super.overview,
      required super.releaseDate,
      required super.runTime,
      required super.voteAverage,
      required super.title});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        title: json['title'],
        backdropPath: json['backdrop_path'],
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runTime: json['runtime'],
        voteAverage: json['vote_average'].toDouble(),
        genres: List<GeneresModel>.from(
          json['genres'].map((e) => GeneresModel.fromJson(e)),
        ),
      );
}
