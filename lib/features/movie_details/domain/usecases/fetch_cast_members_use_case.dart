import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/cast_member_entity.dart';
import '../repositories/movie_details_repository.dart';

class FetchCastMembersUseCase extends BaseUseCase<int, List<CastMemberEntity>> {
  final MovieDetailsRepository movieDetailsRepository;

  FetchCastMembersUseCase({required this.movieDetailsRepository});

  @override
  Future<Either<Failure, List<CastMemberEntity>>> execute(int param) {
    return movieDetailsRepository.fetchCastMembers(param);
  }
}
