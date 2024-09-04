import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/repositories/search_repository.dart';
import '../data_sources/search_remote_data_source.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepositoryImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchSearchedMovies(
      String query) async {
    try {
      List<MovieEntity> movies =
          await searchRemoteDataSource.fetchSearchedMovies(query);
      return right(movies);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
