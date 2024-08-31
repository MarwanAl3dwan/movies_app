import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../../core/common_widgets/line_spacer.dart';
import '../../../../../../core/utils/size_manager.dart';
import 'more_like_this_section.dart';
import 'movie_action_buttons.dart';
import 'movie_backdrop_section.dart';
import 'movie_genres_list_section.dart';
import 'movie_language_and_rating_section.dart';
import 'movie_overview_section.dart';
import 'movie_release_section.dart';
import 'movie_title_section.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key});

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
                const MovieBackdropSection(),
                const SizedBox(height: SizeManager.s16),
                const MovieTitleSection(title: 'Law Abiding Citizen'),
                const SizedBox(height: SizeManager.s14),
                const MovieGenresListSection(),
                const SizedBox(height: SizeManager.s14),
                const MovieReleaseSection(),
                const SizedBox(height: SizeManager.s10),
                const LanguageAndRatingSection(),
                const SizedBox(height: SizeManager.s16),
                const MovieOverviewSection(),
                const SizedBox(height: SizeManager.s20),
                const MovieActionButtons(),
                const SizedBox(height: SizeManager.s20),
                LineSpacer(
                  width: MediaQuery.of(context).size.width / 2,
                  padding:
                      const EdgeInsets.symmetric(horizontal: SizeManager.s14),
                ),
                const SizedBox(height: SizeManager.s20),
                const MoreLikeThisSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
