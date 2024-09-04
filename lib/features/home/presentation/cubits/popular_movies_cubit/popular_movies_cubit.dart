import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/functions.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/fetch_popular_movies_use_case.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.popularMoviesUseCase) : super(PopularMoviesInitial());
  final FetchPopularMoviesUseCase popularMoviesUseCase;

  Future<void> fetchPopularMovies() async {
    emit(PopularMoviesLoading());
    var response = await popularMoviesUseCase.execute();

    response.fold(
      (Failure failure) {
        emit(PopularMoviesFailure(errorMessage: failure.message));
      },
      (List<MovieEntity> movies) {
        var validMovies = excludeMoviesWithCorruptedImages(movies);
        emit(PopularMoviesSuccess(movies: validMovies));
      },
    );
  }
}
