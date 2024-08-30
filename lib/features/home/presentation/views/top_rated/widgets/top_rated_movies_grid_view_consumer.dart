import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../cubits/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import '../../common_widgets/movies_grid_view.dart';
import '../../common_widgets/movies_grid_view_loading.dart';

class TopRatedMoviesGridViewConsumer extends StatefulWidget {
  const TopRatedMoviesGridViewConsumer({
    super.key,
  });

  @override
  State<TopRatedMoviesGridViewConsumer> createState() =>
      _TopRatedMoviesGridViewConsumerState();
}

class _TopRatedMoviesGridViewConsumerState
    extends State<TopRatedMoviesGridViewConsumer> {
  final List<MovieEntity> movies = [];

  @override
  void initState() {
    BlocProvider.of<TopRatedMoviesCubit>(context).fetchTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopRatedMoviesCubit, TopRatedMoviesState>(
      listener: (context, state) {
        if (state is TopRatedMoviesSuccess) {
          movies.addAll(state.movies);
        }
      },
      builder: (context, state) {
        if (state is TopRatedMoviesLoading) {
          return const MoviesGridViewLoading();
        } else if (state is TopRatedMoviesFailure) {
          return Text(state.errorMessage);
        }
        return MoviesGridView(movies: movies);
      },
    );
  }
}
