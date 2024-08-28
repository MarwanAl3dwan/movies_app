import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<MovieEntity>>> fetchNowPlayingMoviesUseCase();
}
