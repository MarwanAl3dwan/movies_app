part of 'now_playing_movies_cubit.dart';

@immutable
abstract class NowPlayingMoviesState {}

class NowPlayingMoviesInitial extends NowPlayingMoviesState {}

class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

class NowPlayingMoviesFailure extends NowPlayingMoviesState {
  final String errorMessage;

  NowPlayingMoviesFailure(this.errorMessage);
}

class NowPlayingMoviesSuccess extends NowPlayingMoviesState {
  final List<MovieEntity> movies;

  NowPlayingMoviesSuccess(this.movies);
}
