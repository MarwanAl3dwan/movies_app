import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../features/home/data/repositories_impl/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/fetch_now_playing_movies_use_case.dart';
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
    FetchNowPlayingMoviesUseCase(homeRepository: instance<HomeRepository>()),
  );
}
