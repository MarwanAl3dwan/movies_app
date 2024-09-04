part of 'cast_members_cubit.dart';

abstract class CastMembersState {}

class CastMembersInitial extends CastMembersState {}

class CastMembersLoading extends CastMembersState {}

class CastMembersSuccess extends CastMembersState {
  final List<CastMemberEntity> castMembers;

  CastMembersSuccess({required this.castMembers});
}

class CastMembersFailure extends CastMembersState {
  final String errorMessage;

  CastMembersFailure({required this.errorMessage});
}
