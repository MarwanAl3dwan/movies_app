import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../home/domain/entities/movie_entity.dart';
import '../../../domain/usecases/movie_search_use_case.dart';

part 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  MovieSearchCubit(this.searchUseCase) : super(MovieSearchInitial());

  final MovieSearchUseCase searchUseCase;
  String searchQuery = '';

  Future<void> fetchSearchedMovies(String query) async {
    emit(MovieSearchLoading());
    searchQuery = query;
    var response = await searchUseCase.execute(query);

    response.fold(
      (Failure failure) {
        emit(MovieSearchFailure(errorMessage: failure.message));
      },
      (List<MovieEntity> movies) {
        var validMovies = excludeMoviesWithCorruptedImages(movies);
        if (validMovies.isEmpty) {
          emit(MovieSearchEmpty());
        } else {
          emit(MovieSearchSuccess(movies: validMovies));
        }
      },
    );
  }

  void emptySearch() {
    emit(MovieSearchEmpty());
  }
}
