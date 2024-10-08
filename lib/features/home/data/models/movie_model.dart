import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  bool? adult;
  String? backdropPath;
  List<int>? genres;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genres,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  }) : super(
          movieId: id!,
          movieTitle: title ?? 'Unknown',
          movieOverview: overview ?? 'Unknown',
          movieBackdropPath: backdropPath ?? 'UnknownImage',
          moviePosterPath: posterPath ?? 'UnknownImage',
          movieOriginalLanguage: originalLanguage ?? 'Unknown',
          movieReleaseDate: releaseDate ?? 'Unknown',
          movieVoteAverage: voteAverage ?? 0.0,
          movieVoteCount: voteCount ?? 0,
          genreIds: genres ?? [],
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json['adult'] as bool?,
        backdropPath: json['backdrop_path'] as String?,
        genres: (json['genre_ids'] as List<dynamic>?)
            ?.map((e) => e as int)
            .toList(),
        id: json['id'] as int?,
        originalLanguage: json['original_language'] as String?,
        originalTitle: json['original_title'] as String?,
        overview: json['overview'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        posterPath: json['poster_path'] as String?,
        releaseDate: json['release_date'] as String?,
        title: json['title'] as String?,
        video: json['video'] as bool?,
        voteAverage: (json['vote_average'] as num?)?.toDouble(),
        voteCount: json['vote_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
