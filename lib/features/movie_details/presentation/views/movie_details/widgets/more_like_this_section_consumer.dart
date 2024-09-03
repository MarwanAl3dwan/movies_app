import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/size_manager.dart';

import '../../../../../home/domain/entities/movie_entity.dart';
import '../../../cubits/similar_movies_cubit/similar_movies_cubit.dart';
import 'more_like_this_loading_section.dart';
import 'more_like_this_section.dart';

class MoreLikeThisSectionConsumer extends StatefulWidget {
  const MoreLikeThisSectionConsumer({super.key});

  @override
  State<MoreLikeThisSectionConsumer> createState() =>
      _MoreLikeThisSectionConsumerState();
}

class _MoreLikeThisSectionConsumerState
    extends State<MoreLikeThisSectionConsumer> {
  final List<MovieEntity> movies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarMoviesCubit, SimilarMoviesState>(
      listener: (context, state) {
        if (state is SimiLarMoviesSuccess) {
          movies.addAll(state.movies);
          for (var movie in state.movies) {
            log(movie.movieTitle);
            log(movie.moviePosterPath);
            log(movie.movieBackdropPath);
            log('------------------------');
          }
        }
      },
      builder: (context, state) {
        if (state is SimiLarMoviesSuccess) {
          return MoreLikeThisSection(movies: movies);
        } else if (state is SimilarMoviesEmpty) {
          return const SizedBox(height: SizeManager.s120);
        } else {
          return const MoreLikeThisLoadingSection();
        }
      },
    );
  }
}
