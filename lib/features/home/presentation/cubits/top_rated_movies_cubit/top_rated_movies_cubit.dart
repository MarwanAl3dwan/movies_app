import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/functions.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/fetch_top_rated_movies_use_case.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(this.topRatedMoviesUseCase)
      : super(TopRatedMoviesInitial());

  final FetchTopRatedMoviesUseCase topRatedMoviesUseCase;

  Future<void> fetchTopRatedMovies() async {
    emit(TopRatedMoviesLoading());

    var response = await topRatedMoviesUseCase.execute();
    response.fold(
      (Failure failure) {
        emit(TopRatedMoviesFailure(errorMessage: failure.message));
      },
      (List<MovieEntity> movies) {
        var validMovies = excludeMoviesWithCorruptedImages(movies);
        emit(TopRatedMoviesSuccess(movies: validMovies));
      },
    );
  }
}
