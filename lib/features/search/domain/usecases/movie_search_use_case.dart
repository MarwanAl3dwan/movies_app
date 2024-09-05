import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../repositories/search_repository.dart';

class MovieSearchUseCase extends BaseUseCase<String, List<MovieEntity>> {
  final SearchRepository searchRepository;

  MovieSearchUseCase({required this.searchRepository});
  @override
  Future<Either<Failure, List<MovieEntity>>> execute(String param) async {
    return await searchRepository.fetchMovieSearch(param);
  }
}
