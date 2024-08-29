import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/di.dart';

import '../../../../domain/usecases/fetch_top_rated_movies_use_case.dart';
import '../../../cubits/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'home_view_section3.dart';

class HomeViewSection3Provider extends StatelessWidget {
  const HomeViewSection3Provider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopRatedMoviesCubit>(
      create: (context) => TopRatedMoviesCubit(
        instance<FetchTopRatedMoviesUseCase>(),
      )..fetchTopRatedMovies(),
      child: const HomeViewSection3(),
    );
  }
}
