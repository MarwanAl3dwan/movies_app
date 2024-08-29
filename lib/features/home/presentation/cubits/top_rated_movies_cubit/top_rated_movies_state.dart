part of 'top_rated_movies_cubit.dart';

abstract class TopRatedMoviesState {}

class TopRatedMoviesInitial extends TopRatedMoviesState {}

class TopRatedMoviesLoading extends TopRatedMoviesState {}

class TopRatedMoviesSuccess extends TopRatedMoviesState {
  final List<MovieEntity> movies;

  TopRatedMoviesSuccess({required this.movies});
}

class TopRatedMoviesFailure extends TopRatedMoviesState {
  final String errorMessage;

  TopRatedMoviesFailure({required this.errorMessage});
}
