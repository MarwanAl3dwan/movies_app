import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/domain/entities/movie_entity.dart';
import '../../../../home/presentation/common_widgets/movies_grid_view.dart';
import '../../../../home/presentation/common_widgets/movies_grid_view_loading.dart';
import '../../cubits/movie_search_cubit/movie_search_cubit.dart';

class MovieSearchGridViewConsumer extends StatefulWidget {
  const MovieSearchGridViewConsumer({super.key});

  @override
  State<MovieSearchGridViewConsumer> createState() =>
      _MovieSearchGridViewConsumerState();
}

class _MovieSearchGridViewConsumerState
    extends State<MovieSearchGridViewConsumer> {
  final List<MovieEntity> movies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieSearchCubit, MovieSearchState>(
      listener: (context, state) {
        if (state is MovieSearchSuccess) {
          movies.clear();
          movies.addAll(state.movies);
        }
      },
      builder: (context, state) {
        if (state is MovieSearchLoading) {
          return const MoviesGridViewLoading();
        } else if (state is MovieSearchFailure) {
          return Text(state.errorMessage);
        } else if (state is MovieSearchEmpty || state is MovieSearchInitial) {
          return const SizedBox();
        } else {
          return MoviesGridView(movies: movies);
        }
      },
    );
  }
}
