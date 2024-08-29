import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/cubits/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/views/home/widgets/now_playing_poster_list.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/utils/size_manager.dart';

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
        if (state is NowPlayingMoviesLoading) {
          return const NowPlayingPosterLoading();
        } else if (state is NowPlayingMoviesFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return NowPlayingPosterList(movies: movies);
      },
    );
  }
}

class NowPlayingPosterLoading extends StatelessWidget {
  const NowPlayingPosterLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.7,
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeManager.s6),
        child: SizedBox(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[100]!,
            highlightColor: Colors.grey[400]!,
            child: Container(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
