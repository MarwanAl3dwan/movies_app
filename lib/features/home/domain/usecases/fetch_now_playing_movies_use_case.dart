import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/usecase/base_use_case.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/home/domain/repositories/home_repository.dart';

class FetchNowPlayingMoviesUseCase extends BaseUseCase {
  final HomeRepository _homeRepository;

  FetchNowPlayingMoviesUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> execute(param) {
    return _homeRepository.fetchNowPlayingMovies();
  }
}
