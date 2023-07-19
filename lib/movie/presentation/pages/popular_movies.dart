import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/enum.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_bloc.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../componenets/popular_movies.dart';

class PopularMoviesPage extends StatelessWidget {
  const PopularMoviesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) =>
            previous.popularMoviesState != current.popularMoviesState,
        builder: (context, state) {
          print("popular bloc${state.popularMoviesState}");
          switch (state.popularMoviesState) {
            case RequestState.loading:
              return const SizedBox(
                  height: 170,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
              return PopularMoviesComponent(
                popularState: state,
              );

            case RequestState.error:
              return Center(
                child: SizedBox(
                    height: 400, child: Text(state.popularMoviesMessage)),
              );
          }
        });
  }
}
