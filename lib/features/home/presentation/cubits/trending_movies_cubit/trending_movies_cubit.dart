import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/functions.dart';
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
        var validMovies = excludeMoviesWithCorruptedImages(movies);
        emit(TrendingMoviesSuccess(movies: validMovies));
      },
    );
  }
}
