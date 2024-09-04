import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../home/domain/entities/movie_entity.dart';
import '../../../cubits/similar_movies_cubit/similar_movies_cubit.dart';
import 'more_like_this_loading_section.dart';
import 'more_like_this_section.dart';

class MoreLikeThisSectionConsumer extends StatefulWidget {
  const MoreLikeThisSectionConsumer({super.key, required this.movieId});

  final int movieId;

  @override
  State<MoreLikeThisSectionConsumer> createState() =>
      _MoreLikeThisSectionConsumerState();
}

class _MoreLikeThisSectionConsumerState
    extends State<MoreLikeThisSectionConsumer> {
  final List<MovieEntity> movies = [];

  @override
  void initState() {
    BlocProvider.of<SimilarMoviesCubit>(context)
        .fetchSimilarMovies(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarMoviesCubit, SimilarMoviesState>(
      listener: (context, state) {
        if (state is SimiLarMoviesSuccess) {
          movies.addAll(state.movies);
        }
      },
      builder: (context, state) {
        if (state is SimiLarMoviesSuccess) {
          return MoreLikeThisSection(
            similarMovies: movies,
            movieId: widget.movieId,
          );
        } else if (state is SimiLarMoviesFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is SimilarMoviesEmpty) {
          return const Center(child: Text('Empty!'));
        } else {
          return const MoreLikeThisLoadingSection();
        }
      },
    );
  }
}
