import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/app_bloc_observer.dart';
import 'core/utils/app_router.dart';
import 'core/utils/colors_manager.dart';
import 'core/utils/di.dart';
import 'features/home/domain/usecases/fetch_now_playing_movies_use_case.dart';
import 'features/home/domain/usecases/fetch_popular_movies_use_case.dart';
import 'features/home/domain/usecases/fetch_top_rated_movies_use_case.dart';
import 'features/home/domain/usecases/fetch_trending_movies_use_case.dart';
import 'features/home/presentation/cubits/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'features/home/presentation/cubits/popular_movies_cubit/popular_movies_cubit.dart';
import 'features/home/presentation/cubits/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'features/home/presentation/cubits/trending_movies_cubit/trending_movies_cubit.dart';
import 'features/home/presentation/views/home/widgets/home_view_header.dart';
import 'features/home/presentation/views/home/widgets/home_view_section1.dart';
import 'features/movie_details/domain/usecases/fetch_cast_members_use_case.dart';
import 'features/movie_details/domain/usecases/fetch_similar_movies_use_case.dart';
import 'features/movie_details/presentation/cubits/cast_members_cubit/cast_members_cubit.dart';
import 'features/movie_details/presentation/cubits/similar_movies_cubit/similar_movies_cubit.dart';
import 'features/search/domain/usecases/search_use_case.dart';
import 'features/search/presentation/cubits/search_cubit.dart';

void main() async {
  await initAppModule();
  Bloc.observer = AppBlocObserver();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowPlayingMoviesCubit>(
          create: (context) => NowPlayingMoviesCubit(
            instance<FetchNowPlayingMoviesUseCase>(),
          )..fetchNowPlayingMovies(),
          child: const HomeViewHeader(),
        ),
        BlocProvider(
          create: (context) => TrendingMoviesCubit(
            instance<FetchTrendingMoviesUseCase>(),
          )..fetchTrendingMovies(),
          child: const HomeViewSection1(),
        ),
        BlocProvider<PopularMoviesCubit>(
          create: (context) => PopularMoviesCubit(
            instance<FetchPopularMoviesUseCase>(),
          )..fetchPopularMovies(),
        ),
        BlocProvider<TopRatedMoviesCubit>(
          create: (context) => TopRatedMoviesCubit(
            instance<FetchTopRatedMoviesUseCase>(),
          )..fetchTopRatedMovies(),
        ),
        BlocProvider<SimilarMoviesCubit>(
          create: (context) => SimilarMoviesCubit(
            instance<FetchSimilarMoviesUseCase>(),
          ),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(
            instance<SearchUseCase>(),
          ),
        ),
        BlocProvider<CastMembersCubit>(
          create: (context) => CastMembersCubit(
            instance<FetchCastMembersUseCase>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorsManager.primary,
          textTheme: ThemeData.dark().textTheme,
        ),
      ),
    );
  }
}
