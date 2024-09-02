import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repository.dart';

class FetchSimilarMoviesUseCase extends BaseUseCase {
  final MovieDetailsRepository movieDetailsRepository;

  FetchSimilarMoviesUseCase({required this.movieDetailsRepository});
  @override
  Future<Either<Failure, dynamic>> execute([param]) {
    return movieDetailsRepository.fetchSimilarMovies(param);
  }
}
