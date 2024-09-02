import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import 'movie_language.dart';
import 'movie_rating.dart';

class LanguageAndRatingSection extends StatelessWidget {
  const LanguageAndRatingSection({
    super.key,
    required this.voteCount,
    required this.rating,
    required this.lang,
  });

  final int voteCount;
  final double rating;
  final String lang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s14),
      child: Row(
        children: [
          MovieLanguage(lang: lang),
          const Spacer(),
          MovieRating(rating: rating, voteCount: voteCount),
        ],
      ),
    );
  }
}
