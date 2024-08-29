import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/views/home/widgets/home_view_section1_loading_list.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../cubits/trending_movies_cubit/trending_movies_cubit.dart';
import '../../../cubits/trending_movies_cubit/trending_movies_state.dart';
import 'home_view_section1_list.dart';

class HomeViewSection1ListConsumer extends StatefulWidget {
  const HomeViewSection1ListConsumer({
    super.key,
  });

  @override
  State<HomeViewSection1ListConsumer> createState() =>
      _HomeViewSection1ListConsumerState();
}

class _HomeViewSection1ListConsumerState
    extends State<HomeViewSection1ListConsumer> {
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
