part of 'person_search_cubit.dart';

abstract class PersonSearchState {}

class PersonSearchInitial extends PersonSearchState {}

class PersonSearchLoading extends PersonSearchState {}

class PersonSearchSuccess extends PersonSearchState {
  final List<PersonEntity> persons;

  PersonSearchSuccess({required this.persons});
}

class PersonSearchEmpty extends PersonSearchState {}

class PersonSearchFailure extends PersonSearchState {
  final String errorMessage;

  PersonSearchFailure({required this.errorMessage});
}
