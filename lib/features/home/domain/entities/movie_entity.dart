class MovieEntity {
  final num id;
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final String originalLanguage;
  final String releaseDate;
  final num voteAverage;
  final num voteCount;

  MovieEntity(
      {required this.id,
      required this.title,
      required this.overview,
      required this.backdropPath,
      required this.posterPath,
      required this.originalLanguage,
      required this.releaseDate,
      required this.voteAverage,
      required this.voteCount});
}
