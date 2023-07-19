import 'package:flutter/material.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_bloc.dart';
import 'package:flutter_application_1/movie/presentation/controller/movies_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/services_locator.dart';
import 'movie/presentation/pages/movies_screen.dart';

void main() {
  ServicLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<MoviesBloc>()
          ..add(GetNowPlayingMoviesEvent())
          ..add(GetPopularMoviesEvent())
          ..add(GetTopRatedMoviesEvent()),
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.grey.shade900,
          ),
          debugShowCheckedModeBanner: false,
          home: const MoviesScreen(),
        ));
  }
}
