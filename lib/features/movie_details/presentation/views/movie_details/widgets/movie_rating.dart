import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../../../../../core/utils/styles_manager.dart';

class MovieRating extends StatelessWidget {
  const MovieRating({super.key, this.rating = 7.9});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: rating,
      maxValue: 10,
      valueLabelTextStyle: StylesManager.textStyle18,
      starSize: 25,
    );
  }
}