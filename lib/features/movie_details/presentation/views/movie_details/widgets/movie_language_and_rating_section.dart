import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import 'movie_language.dart';
import 'movie_rating.dart';

class LanguageAndRatingSection extends StatelessWidget {
  const LanguageAndRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeManager.s14),
      child: Row(
        children: [
          MovieLanguage(),
          Spacer(),
          MovieRating(),
        ],
      ),
    );
  }
}
