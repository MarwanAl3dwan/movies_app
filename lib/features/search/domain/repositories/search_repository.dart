import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<MovieEntity>>> fetchSearchedMovies(String query);
}
