part of 'movie_details_cubit.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieEntity movieEntity;
  MovieDetailsSuccess({required this.movieEntity});
}

class MovieDetailsFailure extends MovieDetailsState {
  final String errorMessage;
  MovieDetailsFailure({required this.errorMessage});
}
