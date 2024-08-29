import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MovieEntity>>> fetchNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> fetchTrendingMovies();
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies();
  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies();
}
