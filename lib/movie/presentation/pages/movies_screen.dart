import 'package:flutter/material.dart';

import 'package:flutter_application_1/movie/presentation/pages/popular_movies.dart';
import 'package:flutter_application_1/movie/presentation/pages/see_more.dart';
import 'package:flutter_application_1/movie/presentation/pages/see_more_toprated.dart';
import 'package:flutter_application_1/movie/presentation/pages/top_rated_screen.dart';
import '../componenets/cagtogary.dart';
import 'now_playing.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingMoviesPage(),
            Catogary(
                title: "Popular",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SeeMorePopularMoviePage(),
                    ),
                  );
                }),
            const PopularMoviesPage(),
            Catogary(
                title: "Top Reated",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SeeMoreTopRatedMoviePage(),
                    ),
                  );
                }),
            const TopRstedMoviesPage(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
