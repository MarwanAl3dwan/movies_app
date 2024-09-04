import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../entities/cast_member_entity.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, List<MovieEntity>>> fetchSimilarMovies(int movieId);
  Future<Either<Failure, List<CastMemberEntity>>> fetchCastMembers(int movieId);
}
