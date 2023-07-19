class ApiConstant {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String nowPlayingMovieEndPoint = "/movie/now_playing";
  static const String apiKey = "e4e44f8b97741f19b9fd9fd0ba7996ad";
  static const String nowPlayingMoviePath =
      "$baseUrl$nowPlayingMovieEndPoint?api_key=$apiKey";

  static const String popularMovieEndPoint = "/movie/popular";
  static const String popularMoviePath =
      "$baseUrl$popularMovieEndPoint?api_key=$apiKey";

  static const String topRatedMovieEndPoint = "/movie/top_rated";
  static const String topRatedMoviePath =
      "$baseUrl$topRatedMovieEndPoint?api_key=$apiKey";

  static const String baseUrlImage = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseUrlImage$path";

  static String detailsMovieUrl(int id) => "$baseUrl/movie/$id?api_key=$apiKey";

  static String recommendationPath(int id) =>
      "$baseUrl/movie/$id/recommendations?api_key=$apiKey";
}
