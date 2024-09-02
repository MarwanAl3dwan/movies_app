import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../repositories/movie_details_repository.dart';

class FetchMovieDetailsUseCase extends BaseUseCase {
  final MovieDetailsRepository movieDetailsRepository;

  FetchMovieDetailsUseCase({required this.movieDetailsRepository});

  @override
  Future<Either<Failure, MovieEntity>> execute([param]) async {
    return movieDetailsRepository.fetchMovieDetails(param);
  }
}
