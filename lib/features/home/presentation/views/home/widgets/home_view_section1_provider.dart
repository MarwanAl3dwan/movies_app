import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/di.dart';

import '../../../../domain/usecases/fetch_trending_movies_use_case.dart';
import '../../../cubits/trending_movies_cubit/trending_movies_cubit.dart';
import 'home_view_section1.dart';

class HomeViewSection1Provider extends StatelessWidget {
  const HomeViewSection1Provider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingMoviesCubit(
        instance<FetchTrendingMoviesUseCase>(),
      )..fetchTrendingMovies(),
      child: const HomeViewSection1(),
    );
  }
}
