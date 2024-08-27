import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/features/home/presentation/views/popular_movies/popular_movies_view.dart';
import 'package:movies_app/features/home/presentation/views/top_rated/top_rated_view.dart';
import 'package:movies_app/features/home/presentation/views/trending_now/trending_now_view.dart';

import '../../features/home/presentation/views/home/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String homeView = '/homeView';
  static const String trendingNowView = '/trendingNowView';
  static const String popularMoviesView = '/popularMoviesView';
  static const String topRatedView = '/topRatedView';

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
