import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieEntity>> fetchMovieDetails(int movieId);
  Future<Either<Failure, List<MovieEntity>>> fetchSimilarMovies(int movieId);
}
