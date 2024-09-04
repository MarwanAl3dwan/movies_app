import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../../core/common_widgets/half_line_spacer.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../home/domain/entities/movie_entity.dart';
import 'cast_member_list_item.dart';
import 'more_like_this_section_consumer.dart';
import 'movie_backdrop_section.dart';
import 'movie_genres_list_section.dart';
import 'movie_language_and_rating_section.dart';
import 'movie_overview_section.dart';
import 'movie_release_section.dart';
import 'movie_title_section.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key, required this.movieEntity});

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieBackdropSection(backdrop: movieEntity.movieBackdropPath),
                const SizedBox(height: SizeManager.s16),
                MovieTitleSection(title: movieEntity.movieTitle),
                const SizedBox(height: SizeManager.s14),
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
                const SizedBox(height: SizeManager.s20),
                const SizedBox(height: SizeManager.s20),
                const HalfLineSpacer(),
                const SizedBox(height: SizeManager.s20),
                const Padding(
                  padding: EdgeInsets.only(left: SizeManager.s14),
                  child: CastMemberListItem(),
                ),
                const SizedBox(height: SizeManager.s20),
                const HalfLineSpacer(),
                const SizedBox(height: SizeManager.s20),
                MoreLikeThisSectionConsumer(movieId: movieEntity.movieId),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
