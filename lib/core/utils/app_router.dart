import 'package:go_router/go_router.dart';
import 'package:movies_app/features/home/presentation/views/trending_now/trending_now_view.dart';

import '../../features/home/presentation/views/home/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String homeView = '/homeView';
  static const String trendingNowView = '/trendingNowView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: trendingNowView,
        builder: (context, state) => const TrendingNowView(),
      ),
    ],
  );
}
