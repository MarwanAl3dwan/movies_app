import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/functions.dart';
import '../../../domain/entities/cast_member_entity.dart';
import '../../../domain/usecases/fetch_cast_members_use_case.dart';

part 'cast_members_state.dart';

class CastMembersCubit extends Cubit<CastMembersState> {
  CastMembersCubit(this._fetchCastMembersUseCase) : super(CastMembersInitial());

  final FetchCastMembersUseCase _fetchCastMembersUseCase;

  Future<void> fetchCastMembers(int movieId) async {
    emit(CastMembersLoading());
    var response = await _fetchCastMembersUseCase.execute(movieId);

    response.fold(
      (Failure failure) {
        emit(CastMembersFailure(errorMessage: failure.message));
      },
      (List<CastMemberEntity> castMembers) {
        var validMembers = excludeCastMembersWithCorruptedImages(castMembers);
        emit(CastMembersSuccess(castMembers: validMembers));
      },
    );
  }
}
