import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/di.dart';

import '../../../../domain/usecases/fetch_popular_movies_use_case.dart';
import '../../../cubits/popular_movies_cubit/popular_movies_cubit.dart';
import 'home_view_section2.dart';

class HomeViewSection2Provider extends StatelessWidget {
  const HomeViewSection2Provider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularMoviesCubit>(
      create: (context) => PopularMoviesCubit(
        instance<FetchPopularMoviesUseCase>(),
      )..fetchPopularMovies(),
      child: const HomeViewSection2(),
    );
  }
}
