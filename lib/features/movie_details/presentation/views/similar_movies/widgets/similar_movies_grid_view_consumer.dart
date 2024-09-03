import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/presentation/common_widgets/movies_grid_view.dart';
import 'package:movies_app/features/movie_details/presentation/cubits/similar_movies_cubit/similar_movies_cubit.dart';

import '../../../../../home/presentation/common_widgets/movies_grid_view_loading.dart';

class SimilarMoviesGridViewConsumer extends StatefulWidget {
  const SimilarMoviesGridViewConsumer({super.key, required this.movieId});

  final int movieId;

  @override
  State<SimilarMoviesGridViewConsumer> createState() =>
      _SimilarMoviesGridViewConsumerState();
}

class _SimilarMoviesGridViewConsumerState
    extends State<SimilarMoviesGridViewConsumer> {
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
    }, builder: (context, state) {
      if (state is SimiLarMoviesSuccess) {
        return MoviesGridView(movies: movies);
      } else if (state is SimiLarMoviesFailure) {
        return Center(child: Text(state.errorMessage));
      } else {
        return const MoviesGridViewLoading();
      }
    });
  }
}
