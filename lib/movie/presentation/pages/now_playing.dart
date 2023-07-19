import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/enum.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_bloc.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../componenets/now_playing.dart';

class NowPlayingMoviesPage extends StatelessWidget {
  const NowPlayingMoviesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) =>
            previous.nowPlayingMoviesState != current.nowPlayingMoviesState,
        builder: (context, state) {
          print("now playing bloc${state.nowPlayingMoviesState}");
          switch (state.nowPlayingMoviesState) {
            case RequestState.loading:
              return const SizedBox(
                  height: 400,
                  child: Center(child: CircularProgressIndicator()));
            case RequestState.loaded:
              return NowPlayingComponenet(
                nowPlayingState: state,
              );

            case RequestState.error:
              return Center(
                child:
                    SizedBox(height: 400, child: Text(state.nowPlayingMessage)),
              );
          }
        });
  }
}
