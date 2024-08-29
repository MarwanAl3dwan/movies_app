import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/usecases/fetch_popular_movies_use_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/movie_entity.dart';

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
        emit(PopularMoviesSuccess(movies: movies));
      },
    );
  }
}
