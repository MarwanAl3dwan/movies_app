import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl({required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchNowPlayingMovies() async {
    try {
      List<MovieEntity> moviesList =
          await homeRemoteDataSource.fetchNowPlayingMovies();
      return right(moviesList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchTrendingMovies() async {
    try {
      List<MovieEntity> moviesList =
          await homeRemoteDataSource.fetchTrendingMovies();
      return right(moviesList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies() async {
    try {
      List<MovieEntity> moviesList =
          await homeRemoteDataSource.fetchPopularMovies();
      return right(moviesList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
