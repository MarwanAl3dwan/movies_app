import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../home/domain/entities/movie_entity.dart';
import '../../../domain/usecases/fetch_similar_movies_use_case.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit(this.similarMoviesUseCase) : super(SimiLarMoviesInitial());

  final FetchSimilarMoviesUseCase similarMoviesUseCase;

  Future<void> fetchSimilarMovies(int movieId) async {
    emit(SimiLarMoviesLoading());
    var response = await similarMoviesUseCase.execute(movieId);

    response.fold(
      (Failure failure) {
        emit(SimiLarMoviesFailure(errorMessage: failure.message));
      },
      (List<MovieEntity> movies) {
        var validMovies = excludeMoviesWithCorruptedImages(movies);
        if (validMovies.isEmpty) {
          emit(SimilarMoviesEmpty());
        } else {
          emit(SimiLarMoviesSuccess(movies: validMovies));
        }
      },
    );
  }
}
