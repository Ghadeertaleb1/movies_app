import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/enum.dart';
import 'package:flutter_application_1/movie/presentation/componenets/top_rated_component.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_bloc.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRstedMoviesPage extends StatelessWidget {
  const TopRstedMoviesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) =>
            previous.topRatedMoviesState != current.topRatedMoviesState,
        builder: (context, state) {
          switch (state.topRatedMoviesState) {
            case RequestState.loading:
              return const SizedBox(
                  height: 170,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
              return TopRatedMoviesComponent(
                topRatedState: state,
              );

            case RequestState.error:
              return Center(
                child:
                    SizedBox(height: 400, child: Text(state.topRatedMessage)),
              );
          }
        });
  }
}
