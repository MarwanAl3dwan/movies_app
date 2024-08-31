import 'package:flutter/material.dart';

import 'movie_language.dart';
import 'movie_rating.dart';

class LanguageAndRatingSection extends StatelessWidget {
  const LanguageAndRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        MovieLanguage(),
        Spacer(),
        MovieRating(),
      ],
    );
  }
}