part of 'movie_search_cubit.dart';

abstract class MovieSearchState {}

class MovieSearchInitial extends MovieSearchState {}

class MovieSearchLoading extends MovieSearchState {}

class MovieSearchSuccess extends MovieSearchState {
  final List<MovieEntity> movies;

  MovieSearchSuccess({required this.movies});
}

class MovieSearchEmpty extends MovieSearchState {}

class MovieSearchFailure extends MovieSearchState {
  final String errorMessage;

  MovieSearchFailure({required this.errorMessage});
}
