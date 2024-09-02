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
        }
      },
      builder: (context, state) {
        if (state is SimiLarMoviesSuccess) {
          if (movies.isNotEmpty) {
            return MoreLikeThisSection(movies: movies);
          } else {
            return const MoreLikeThisEmpty();
          }
        } else {
          return const MoreLikeThisLoadingSection();
        }
      },
    );
  }
}

class MoreLikeThisEmpty extends StatelessWidget {
  const MoreLikeThisEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: SizeManager.s120);
  }
}
