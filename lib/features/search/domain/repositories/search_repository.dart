import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../entities/person_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<MovieEntity>>> fetchMovieSearch(String query);
  Future<Either<Failure, List<PersonEntity>>> fetchPersonSearch(String query);
}
