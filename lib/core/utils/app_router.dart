import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/domain/entities/movie_entity.dart';
import '../../features/home/presentation/views/home/home_view.dart';
import '../../features/home/presentation/views/popular_movies/popular_movies_view.dart';
import '../../features/home/presentation/views/top_rated/top_rated_view.dart';
import '../../features/home/presentation/views/trending_now/trending_now_view.dart';
import '../../features/movie_details/presentation/views/movie_details/movie_details_view.dart';
import '../../features/movie_details/presentation/views/similar_movies/similar_movies_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String homeView = '/homeView';
  static const String trendingNowView = '/trendingNowView';
  static const String popularMoviesView = '/popularMoviesView';
  static const String topRatedView = '/topRatedView';
  static const String movieDetailsView = '/movieDetailsView';
  static const String similarMoviesView = '/similarMoviesView';
  static const String searchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: trendingNowView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const TrendingNowView(),
        ),
      ),
      GoRoute(
        path: popularMoviesView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const PopularMoviesView(),
        ),
      ),
      GoRoute(
        path: topRatedView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const TopRatedView(),
        ),
      ),
      GoRoute(
        path: movieDetailsView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: MovieDetailsView(movieEntity: state.extra as MovieEntity),
        ),
      ),
      GoRoute(
        path: similarMoviesView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: SimilarMoviesView(movieId: state.extra as int),
        ),
      ),
      GoRoute(
        path: searchView,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SearchView(),
        ),
      ),
    ],
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.linearToEaseOut).animate(animation),
        child: child,
      );
    },
  );
}
