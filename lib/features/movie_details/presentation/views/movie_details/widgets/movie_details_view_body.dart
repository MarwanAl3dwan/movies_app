import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../../core/utils/size_manager.dart';
import 'movie_backdrop_section.dart';
import 'movie_genres_list.dart';
import 'movie_language_and_rating_section.dart';
import 'movie_release_section.dart';
import 'movie_title.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        MovieBackdropSection(),
        SizedBox(height: SizeManager.s16),
        MovieTitle(title: 'Law Abiding Citizen'),
        SizedBox(height: SizeManager.s14),
        MovieGenresList(),
        SizedBox(height: SizeManager.s14),
        MovieReleaseSection(),
        SizedBox(height: SizeManager.s10),
        LanguageAndRatingSection(),
      ],
    );
  }
}
