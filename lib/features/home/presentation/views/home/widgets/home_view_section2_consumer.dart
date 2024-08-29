import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../cubits/popular_movies_cubit/popular_movies_cubit.dart';
import 'home_view_section2_list.dart';
import 'home_view_section2_loading_list.dart';

class HomeViewSection2Consumer extends StatefulWidget {
  const HomeViewSection2Consumer({
    super.key,
  });

  @override
  State<HomeViewSection2Consumer> createState() =>
      _HomeViewSection2ConsumerState();
}

class _HomeViewSection2ConsumerState extends State<HomeViewSection2Consumer> {
  final List<MovieEntity> movies = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularMoviesCubit, PopularMoviesState>(
      listener: (context, state) {
        if (state is PopularMoviesSuccess) {
          movies.addAll(state.movies);
        }
      },
      builder: (context, state) {
        if (state is PopularMoviesSuccess) {
          return HomeViewSection2List(movies: movies);
        } else if (state is PopularMoviesFailure) {
          return Center(child: Text(state.errorMessage));
        }
        return const HomeViewSection2LoadingList();
      },
    );
  }
}
