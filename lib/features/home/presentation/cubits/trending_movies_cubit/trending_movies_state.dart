part of 'trending_movies_cubit.dart';

abstract class TrendingMoviesState {}

class TrendingMoviesInitial extends TrendingMoviesState {}

class TrendingMoviesLoading extends TrendingMoviesState {}


class TrendingMoviesSuccess extends TrendingMoviesState {
  final List<MovieEntity> movies;

  TrendingMoviesSuccess({required this.movies});
}


class TrendingMoviesFailure extends TrendingMoviesState {
  final String errorMessage;

  TrendingMoviesFailure({required this.errorMessage});
}

