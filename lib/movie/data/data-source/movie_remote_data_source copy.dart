import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/network/error.dart';
import 'package:flutter_application_1/core/network/exception.dart';
import 'package:flutter_application_1/core/utils/app_constant.dart';
import 'package:flutter_application_1/movie/data/model/details_model.dart';
import 'package:flutter_application_1/movie/data/model/movie_model.dart';
import 'package:flutter_application_1/movie/data/model/recommendation_model.dart';
import 'package:flutter_application_1/movie/domain/usecase/get_movie_recommend.dart';

abstract class BaseRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(int id);
  Future<List<RecommendationModel>> getRecommendationMovies(
      RecommendationParameter parameter);
}

class DioRemoteDataSource extends BaseRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstant.nowPlayingMoviePath);
    //print(response);
    return checkResponse(response);
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstant.popularMoviePath);

    return checkResponse(response);
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstant.topRatedMoviePath);
    return checkResponse(response);
  }

  checkResponse(currentResponse) {
    if (currentResponse.statusCode == 200) {
      return List<MovieModel>.from(
          (currentResponse.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorModel: ErrorModel.fromJson(currentResponse.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final response = await Dio().get(ApiConstant.detailsMovieUrl(id));
    if (response.statusCode == 200) {
      return (MovieDetailsModel.fromJson((response.data)));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendationMovies(
      RecommendationParameter parameter) async {
    final response =
        await Dio().get(ApiConstant.recommendationPath(parameter.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
          (response.data["results"] as List).map(
        (e) => RecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(errorModel: ErrorModel.fromJson(response.data));
    }
  }
}
