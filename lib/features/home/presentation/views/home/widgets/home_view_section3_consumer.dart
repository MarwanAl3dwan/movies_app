import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../cubits/top_rated_movies_cubit/top_rated_movies_cubit.dart';

import 'home_view_section3_list.dart';
import 'home_view_section3_loading_list.dart';

class HomeViewSection3Consumer extends StatefulWidget {
  const HomeViewSection3Consumer({
    super.key,
  });

  @override
  State<HomeViewSection3Consumer> createState() =>
      _HomeViewSection3ConsumerState();
}

class _HomeViewSection3ConsumerState extends State<HomeViewSection3Consumer> {
  final List<MovieEntity> movies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopRatedMoviesCubit, TopRatedMoviesState>(
      listener: (context, state) {
        if (state is TopRatedMoviesSuccess) {
          movies.addAll(state.movies);
        }
      },
      builder: (context, state) {
        if (state is TopRatedMoviesSuccess) {
          return HomeViewSection3List(movies: movies);
        } else if (state is TopRatedMoviesFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return const HomeViewSection3LoadingList();
      },
    );
  }
}
