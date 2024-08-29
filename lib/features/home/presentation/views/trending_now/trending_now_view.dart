import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/usecases/fetch_trending_movies_use_case.dart';
import 'package:movies_app/features/home/presentation/cubits/trending_movies_cubit/trending_movies_cubit.dart';

import '../../../../../core/utils/di.dart';
import 'widgets/trending_now_view_body.dart';

class TrendingNowView extends StatelessWidget {
  const TrendingNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<TrendingMoviesCubit>(
        create: (context) => TrendingMoviesCubit(
          instance<FetchTrendingMoviesUseCase>(),
        )..fetchTrendingMovies(),
        child: const TrendingNowViewBody(),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
