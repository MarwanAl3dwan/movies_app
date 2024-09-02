import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/domain/entities/movie_entity.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());

  MovieEntity? movieEntity;

  void saveMovieEntity(MovieEntity movie) {
    movieEntity = movie;
  }

  MovieEntity? getMovieEntity() {
    return movieEntity;
  }
}
