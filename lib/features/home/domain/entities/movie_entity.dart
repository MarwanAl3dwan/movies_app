class MovieEntity {
  final int movieId;
  final String movieTitle;
  final String movieOverview;
  final String movieBackdropPath;
  final String moviePosterPath;
  final String movieOriginalLanguage;
  final String movieReleaseDate;
  final double movieVoteAverage;
  final int movieVoteCount;
  final List<int> genres;

  MovieEntity({
    required this.movieId,
    required this.movieTitle,
    required this.movieOverview,
    required this.movieBackdropPath,
    required this.moviePosterPath,
    required this.movieOriginalLanguage,
    required this.movieReleaseDate,
    required this.movieVoteAverage,
    required this.movieVoteCount,
    required this.genres,
  });
}
