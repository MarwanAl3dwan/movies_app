import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/cubits/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/views/home/widgets/now_playing_poster_list.dart';

class NowPlayingPosterListBlocConsumer extends StatefulWidget {
  const NowPlayingPosterListBlocConsumer({super.key});

  @override
  State<NowPlayingPosterListBlocConsumer> createState() =>
      _NowPlayingPosterListBlocConsumerState();
}

class _NowPlayingPosterListBlocConsumerState
    extends State<NowPlayingPosterListBlocConsumer> {
  final List<MovieEntity> movies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NowPlayingMoviesCubit, NowPlayingMoviesState>(
      listener: (context, state) {
        if (state is NowPlayingMoviesSuccess) {
          movies.addAll(state.movies);
        } else if (state is NowPlayingMoviesFailure) {
          log(state.errorMessage);
        }
      },
      builder: (context, state) {
        return NowPlayingPosterList(movies: movies);
      },
    );
  }
}
