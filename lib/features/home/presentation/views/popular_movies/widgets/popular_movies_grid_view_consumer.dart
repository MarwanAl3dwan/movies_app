import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/common_widgets/movies_grid_view_loading.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../cubits/popular_movies_cubit/popular_movies_cubit.dart';
import '../../../common_widgets/movies_grid_view.dart';

class PopularMoviesGridViewConsumer extends StatefulWidget {
  const PopularMoviesGridViewConsumer({
    super.key,
  });

  @override
  State<PopularMoviesGridViewConsumer> createState() =>
      _PopularMoviesGridViewConsumerState();
}

class _PopularMoviesGridViewConsumerState
    extends State<PopularMoviesGridViewConsumer> {
  final List<MovieEntity> movies = [];

  @override
  void initState() {
    BlocProvider.of<PopularMoviesCubit>(context).fetchPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularMoviesCubit, PopularMoviesState>(
      listener: (context, state) {
        if (state is PopularMoviesSuccess) {
          movies.addAll(state.movies);
        }
      },
      builder: (context, state) {
        if (state is PopularMoviesLoading) {
          return const MoviesGridViewLoading();
        } else if (state is PopularMoviesFailure) {
          return Text(state.errorMessage);
        }
        return MoviesGridView(movies: movies);
      },
    );
  }
}
