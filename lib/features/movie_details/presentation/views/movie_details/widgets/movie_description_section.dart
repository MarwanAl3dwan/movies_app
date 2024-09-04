import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../home/domain/entities/movie_entity.dart';
import 'movie_genres_list_section.dart';
import 'movie_language_and_rating_section.dart';
import 'movie_overview_section.dart';
import 'movie_release_section.dart';

class MovieDescriptionSection extends StatelessWidget {
  const MovieDescriptionSection({
    super.key,
    required this.movieEntity,
  });

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieGenresListSection(genres: movieEntity.genreIds),
        const SizedBox(height: SizeManager.s14),
        MovieReleaseSection(releaseDate: movieEntity.movieReleaseDate),
        const SizedBox(height: SizeManager.s10),
        LanguageAndRatingSection(
          lang: movieEntity.movieOriginalLanguage,
          rating: movieEntity.movieVoteAverage,
          voteCount: movieEntity.movieVoteCount,
        ),
        const SizedBox(height: SizeManager.s16),
        MovieOverviewSection(overview: movieEntity.movieOverview),
      ],
    );
  }
}