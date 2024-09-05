import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/functions.dart';
import '../../../domain/entities/person_entity.dart';
import '../../../domain/usecases/person_search_use_case.dart';

part 'person_search_state.dart';

class PersonSearchCubit extends Cubit<PersonSearchState> {
  PersonSearchCubit(this.personSearchUseCase) : super(PersonSearchInitial());

  final PersonSearchUseCase personSearchUseCase;
  String searchQuery = '';

  Future<void> fetchPersonSearch(String query) async {
    emit(PersonSearchLoading());
    searchQuery = query;
    var response = await personSearchUseCase.execute(query);

    response.fold(
      (Failure failure) {
        emit(PersonSearchFailure(errorMessage: failure.message));
      },
      (List<PersonEntity> persons) {
        var validPersons = excludePersonsWithCorruptedImages(persons);
        if (validPersons.isEmpty) {
          emit(PersonSearchEmpty());
        } else {
          emit(PersonSearchSuccess(persons: validPersons));
        }
      },
    );
  }

  void emptySearch() {
    emit(PersonSearchEmpty());
  }
}
