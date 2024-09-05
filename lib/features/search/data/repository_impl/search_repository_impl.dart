import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/features/search/domain/entities/person_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/repositories/search_repository.dart';
import '../data_sources/search_remote_data_source.dart';

class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepositoryImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> fetchMovieSearch(
      String query) async {
    try {
      List<MovieEntity> movies =
          await searchRemoteDataSource.fetchMovieSearch(query);
      return right(movies);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> fetchPersonSearch(
      String query) async {
    try {
      List<PersonEntity> persons =
          await searchRemoteDataSource.fetchPersonSearch(query);
      return right(persons);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
