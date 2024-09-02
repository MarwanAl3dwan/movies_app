part of 'similar_movies_cubit.dart';

abstract class SimilarMoviesState {}

class SimiLarMoviesInitial extends SimilarMoviesState {}

class SimiLarMoviesLoading extends SimilarMoviesState {}

class SimiLarMoviesSuccess extends SimilarMoviesState {
  final List<MovieEntity> movies;

  SimiLarMoviesSuccess({required this.movies});
}

class SimiLarMoviesFailure extends SimilarMoviesState {
  final String errorMessage;

  SimiLarMoviesFailure({required this.errorMessage});
}
