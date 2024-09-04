import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/cast_member_entity.dart';
import '../../../domain/usecases/fetch_cast_members_use_case.dart';

part 'cast_members_state.dart';

class CastMembersCubit extends Cubit<CastMembersState> {
  CastMembersCubit(this.fetchCastMembersUseCase) : super(CastMembersInitial());

  final FetchCastMembersUseCase fetchCastMembersUseCase;

  Future<void> fetchCastMembers(int movieId) async {
    emit(CastMembersLoading());
    var response = await fetchCastMembersUseCase.execute(movieId);

    response.fold(
      (Failure failure) {
        emit(CastMembersFailure(errorMessage: failure.message));
      },
      (List<CastMemberEntity> castMembers) {
        emit(CastMembersSuccess(castMembers: castMembers));
      },
    );
  }
}
