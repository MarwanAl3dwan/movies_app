import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/repositories/movie_details_repository.dart';
import '../data_sources/movie_details_remote_data_source.dart';

class MovieDetailsRepositoryImpl extends MovieDetailsRepository {
  final MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;

  MovieDetailsRepositoryImpl({required this.movieDetailsRemoteDataSource});

  @override
  Future<Either<Failure, MovieEntity>> fetchMovieDetails(int movieId) async {
    try {
      MovieEntity movie =
          await movieDetailsRemoteDataSource.fetchMovieDetails(movieId);
      return right(movie);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
