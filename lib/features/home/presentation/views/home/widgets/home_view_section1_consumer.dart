import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../cubits/trending_movies_cubit/trending_movies_cubit.dart';
import 'home_view_section1_list.dart';
import 'home_view_section1_loading_list.dart';

class HomeViewSection1Consumer extends StatefulWidget {
  const HomeViewSection1Consumer({
    super.key,
  });

  @override
  State<HomeViewSection1Consumer> createState() =>
      _HomeViewSection1ConsumerState();
}

class _HomeViewSection1ConsumerState extends State<HomeViewSection1Consumer> {
  final List<MovieEntity> movies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrendingMoviesCubit, TrendingMoviesState>(
      listener: (context, state) {
        if (state is TrendingMoviesSuccess) {
          movies.addAll(state.movies);
        }
      },
      builder: (context, state) {
        if (state is TrendingMoviesSuccess) {
          return HomeViewSection1List(movies: movies);
        } else if (state is TrendingMoviesFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return const HomeViewSection1LoadingList();
      },
    );
  }
}
