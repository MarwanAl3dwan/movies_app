import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../cubits/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'now_playing_poster_list.dart';
import 'now_playing_poster_loading.dart';

class NowPlayingPosterListConsumer extends StatefulWidget {
  const NowPlayingPosterListConsumer({super.key});

  @override
  State<NowPlayingPosterListConsumer> createState() =>
      _NowPlayingPosterListConsumerState();
}

class _NowPlayingPosterListConsumerState
    extends State<NowPlayingPosterListConsumer> {
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
        if (state is NowPlayingMoviesSuccess) {
          return NowPlayingPosterList(movies: movies);
        } else if (state is NowPlayingMoviesFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return const NowPlayingPosterLoading();
      },
    );
  }
}
