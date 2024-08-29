import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/usecases/fetch_popular_movies_use_case.dart';
import 'package:movies_app/features/home/presentation/cubits/popular_movies_cubit/popular_movies_cubit.dart';

import '../../../../../core/utils/di.dart';
import 'widgets/popular_movies_view_body.dart';

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PopularMoviesCubit>(
        create: (context) => PopularMoviesCubit(
          instance<FetchPopularMoviesUseCase>(),
        )..fetchPopularMovies(),
        child: const PopularMoviesViewBody(),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
