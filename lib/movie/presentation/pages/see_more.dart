import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/enum.dart';
import 'package:flutter_application_1/movie/presentation/componenets/popular_see_more.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_bloc.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeMorePopularMoviePage extends StatelessWidget {
  const SeeMorePopularMoviePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) =>
            previous.popularMoviesState != current.popularMoviesState,
        builder: (context, state) {
          switch (state.popularMoviesState) {
            case RequestState.loading:
              return const SizedBox(
                  height: 170,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
              return SeeMorePopularComponent(popularState: state);

            case RequestState.error:
              return Center(
                child: SizedBox(
                    height: 400, child: Text(state.popularMoviesMessage)),
              );
          }
        });
  }
}
