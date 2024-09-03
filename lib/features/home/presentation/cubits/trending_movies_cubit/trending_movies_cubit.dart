import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/fetch_trending_movies_use_case.dart';
part 'trending_movies_state.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit(this.trendingMoviesUseCase)
      : super(TrendingMoviesInitial());

  final FetchTrendingMoviesUseCase trendingMoviesUseCase;

  Future<void> fetchTrendingMovies() async {
    emit(TrendingMoviesLoading());
    var response = await trendingMoviesUseCase.execute();

    response.fold(
      (Failure failure) {
        emit(TrendingMoviesFailure(errorMessage: failure.message));
      },
      (List<MovieEntity> movies) {
        List<MovieEntity> validMovies = movies
            .where((movie) =>
                movie.moviePosterPath != 'UnknownImage' &&
                movie.movieBackdropPath != 'UnknownImage')
            .toList();
        emit(TrendingMoviesSuccess(movies: validMovies));
      },
    );
  }
}
