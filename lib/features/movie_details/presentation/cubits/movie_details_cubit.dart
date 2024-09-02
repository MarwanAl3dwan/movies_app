import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/usecases/fetch_movie_details_use_case.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.movieDetailsUseCase) : super(MovieDetailsInitial());

  final FetchMovieDetailsUseCase movieDetailsUseCase;

  Future<void> fetchMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());
    var response = await movieDetailsUseCase.execute(movieId);

    response.fold(
      (Failure failure) {
        emit(MovieDetailsFailure(errorMessage: failure.message));
      },
      (MovieEntity movie) {
        emit(MovieDetailsSuccess(movieEntity: movie));
      },
    );
  }
}
