import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/usecases/search_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial());

  final SearchUseCase searchUseCase;
  String searchQuery = '';

  Future<void> fetchSearchedMovies(String query) async {
    emit(SearchLoading());
    searchQuery = query;
    var response = await searchUseCase.execute(query);

    response.fold(
      (Failure failure) {
        emit(SearchFailure(errorMessage: failure.message));
      },
      (List<MovieEntity> movies) {
        List<MovieEntity> validMovies = movies
            .where((movie) =>
                movie.moviePosterPath != 'UnknownImage' &&
                movie.movieBackdropPath != 'UnknownImage')
            .toList();
        if (validMovies.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchSuccess(movies: validMovies));
        }
      },
    );
  }

  void emptySearch() {
    emit(SearchEmpty());
  }
}
