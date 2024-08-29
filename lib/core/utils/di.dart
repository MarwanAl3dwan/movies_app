import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/features/home/domain/usecases/fetch_popular_movies_use_case.dart';
import 'package:movies_app/features/home/domain/usecases/fetch_top_rated_movies_use_case.dart';

import '../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../features/home/data/repositories_impl/home_repository_impl.dart';
import '../../features/home/domain/usecases/fetch_now_playing_movies_use_case.dart';
import '../../features/home/domain/usecases/fetch_trending_movies_use_case.dart';
import 'api_service.dart';

final GetIt instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerSingleton<Dio>(Dio());

  instance.registerSingleton<ApiService>(ApiService(instance<Dio>()));

  instance.registerSingleton<HomeRemoteDataSourceImpl>(
    HomeRemoteDataSourceImpl(apiService: instance<ApiService>()),
  );

  instance.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl(
    homeRemoteDataSource: instance<HomeRemoteDataSourceImpl>(),
  ));

  instance.registerSingleton<FetchNowPlayingMoviesUseCase>(
    FetchNowPlayingMoviesUseCase(
      homeRepository: instance<HomeRepositoryImpl>(),
    ),
  );

  instance.registerSingleton<FetchTrendingMoviesUseCase>(
    FetchTrendingMoviesUseCase(
      homeRepository: instance<HomeRepositoryImpl>(),
    ),
  );

  instance.registerSingleton<FetchPopularMoviesUseCase>(
    FetchPopularMoviesUseCase(
      homeRepository: instance<HomeRepositoryImpl>(),
    ),
  );

  instance.registerSingleton<FetchTopRatedMoviesUseCase>(
    FetchTopRatedMoviesUseCase(
      homeRepository: instance<HomeRepositoryImpl>(),
    ),
  );
}
