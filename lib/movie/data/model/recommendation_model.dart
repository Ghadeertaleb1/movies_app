import 'package:flutter_application_1/movie/domain/entity/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.id, super.backdropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
          id: json['id'],
          backdropPath:
              json['backdrop_path'] ?? "/b8Ylp5q46U2u52QxTmDzXwtnQR.jpg");
}
