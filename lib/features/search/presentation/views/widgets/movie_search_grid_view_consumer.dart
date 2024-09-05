import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/domain/entities/movie_entity.dart';
import '../../../../home/presentation/common_widgets/movies_grid_view.dart';
import '../../../../home/presentation/common_widgets/movies_grid_view_loading.dart';
import '../../cubits/search_cubit.dart';

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
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          movies.clear();
          movies.addAll(state.movies);
        }
      },
      builder: (context, state) {
        if (state is SearchLoading) {
          return const MoviesGridViewLoading();
        } else if (state is SearchFailure) {
          return Text(state.errorMessage);
        } else if (state is SearchEmpty || state is SearchInitial) {
          return const SizedBox();
        } else {
          return MoviesGridView(movies: movies);
        }
      },
    );
  }
}
