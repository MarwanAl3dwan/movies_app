import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../cubits/trending_movies_cubit/trending_movies_cubit.dart';
import '../../common_widgets/movies_grid_view.dart';
import '../../common_widgets/movies_grid_view_loading.dart';

class TrendingNowMoviesGridViewConsumer extends StatefulWidget {
  const TrendingNowMoviesGridViewConsumer({
    super.key,
  });

  @override
  State<TrendingNowMoviesGridViewConsumer> createState() =>
      _TrendingNowMoviesGridViewConsumerState();
}

class _TrendingNowMoviesGridViewConsumerState
    extends State<TrendingNowMoviesGridViewConsumer> {
  final List<MovieEntity> movies = [];

  @override
  void initState() {
    BlocProvider.of<TrendingMoviesCubit>(context).fetchTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrendingMoviesCubit, TrendingMoviesState>(
      listener: (context, state) {
        if (state is TrendingMoviesSuccess) {
          movies.addAll(state.movies);
        }
      },
      builder: (context, state) {
        if (state is TrendingMoviesLoading) {
          return const MoviesGridViewLoading();
        } else if (state is TrendingMoviesFailure) {
          return Text(state.errorMessage);
        }
        return MoviesGridView(movies: movies);
      },
    );
  }
}
