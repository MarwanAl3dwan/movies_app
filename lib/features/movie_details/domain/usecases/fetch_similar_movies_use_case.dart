import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../repositories/movie_details_repository.dart';

class FetchSimilarMoviesUseCase extends BaseUseCase<int, List<MovieEntity>> {
  final MovieDetailsRepository movieDetailsRepository;

  FetchSimilarMoviesUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, List<MovieEntity>>> execute(int param) {
    return movieDetailsRepository.fetchSimilarMovies(param);
  }
}
