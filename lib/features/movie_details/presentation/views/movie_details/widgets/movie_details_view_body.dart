import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../../core/common_widgets/half_line_spacer.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../home/domain/entities/movie_entity.dart';
import 'more_like_this_section_consumer.dart';
import 'movie_backdrop_section.dart';
import 'movie_description_section.dart';
import 'movie_title_section.dart';
import 'top_cast_billed_section_consumer.dart';

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
                MovieDescriptionSection(movieEntity: movieEntity),
                const SizedBox(height: SizeManager.s20),
                const HalfLineSpacer(),
                const SizedBox(height: SizeManager.s20),
                TopCastBilledSectionConsumer(movieId: movieEntity.movieId),
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
