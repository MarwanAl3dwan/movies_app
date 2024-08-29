import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/usecases/fetch_trending_movies_use_case.dart';
import 'package:movies_app/features/home/presentation/cubits/trending_movies_cubit/trending_movies_cubit.dart';

import '../../../../../core/utils/di.dart';
import '../../../domain/usecases/fetch_now_playing_movies_use_case.dart';
import '../../cubits/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import '../common_widgets/custom_bottom_nav_bar.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<NowPlayingMoviesCubit>(
            create: (context) => NowPlayingMoviesCubit(
              instance<FetchNowPlayingMoviesUseCase>(),
            )..fetchNowPlayingMovies(),
          ),
          BlocProvider<TrendingMoviesCubit>(
            create: (context) => TrendingMoviesCubit(
              instance<FetchTrendingMoviesUseCase>(),
            )..fetchTrendingMovies(),
          ),
        ],
        child: const HomeViewBody(),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
