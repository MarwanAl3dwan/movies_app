import 'package:dartz/dartz.dart';

import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/search/domain/repositories/search_repository.dart';

import '../../../../core/usecase/base_use_case.dart';
import '../entities/person_entity.dart';

class PersonSearchUseCase extends BaseUseCase<String, List<PersonEntity>> {
  final SearchRepository searchRepository;

  PersonSearchUseCase({required this.searchRepository});

  @override
  Future<Either<Failure, List<PersonEntity>>> execute(String param) async {
    return await searchRepository.fetchPersonSearch(param);
  }
}
