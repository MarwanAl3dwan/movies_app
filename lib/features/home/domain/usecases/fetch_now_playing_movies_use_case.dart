import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/movie_entity.dart';
import '../repositories/home_repository.dart';

class FetchNowPlayingMoviesUseCase extends BaseUseCase {
  final HomeRepository homeRepository;

  FetchNowPlayingMoviesUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, List<MovieEntity>>> execute([param]) {
    return homeRepository.fetchNowPlayingMovies();
  }
}
