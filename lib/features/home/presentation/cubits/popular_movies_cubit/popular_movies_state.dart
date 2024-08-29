part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesSuccess extends PopularMoviesState {
  final List<MovieEntity> movies;

  PopularMoviesSuccess({required this.movies});
}

class PopularMoviesFailure extends PopularMoviesState {
  final String errorMessage;

  PopularMoviesFailure({required this.errorMessage});
}
