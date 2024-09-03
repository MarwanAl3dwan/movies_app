import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/usecases/fetch_now_playing_movies_use_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/movie_entity.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit(this._nowPlayingMoviesUseCase)
      : super(NowPlayingMoviesInitial());

  final FetchNowPlayingMoviesUseCase _nowPlayingMoviesUseCase;

  Future<void> fetchNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    var response = await _nowPlayingMoviesUseCase.execute();

    response.fold(
      (Failure failure) {
        emit(NowPlayingMoviesFailure(failure.message));
      },
      (List<MovieEntity> movies) {
        List<MovieEntity> validMovies = movies
            .where((movie) =>
                movie.moviePosterPath != 'UnknownImage' &&
                movie.movieBackdropPath != 'UnknownImage')
            .toList();
        emit(NowPlayingMoviesSuccess(validMovies));
      },
    );
  }
}
