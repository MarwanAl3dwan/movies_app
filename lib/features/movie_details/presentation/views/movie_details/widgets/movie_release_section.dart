import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'movie_genre_item.dart';
import 'stream_flix_movie_tag.dart';

class MovieReleaseSection extends StatelessWidget {
  const MovieReleaseSection({super.key, required this.releaseDate});

  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s14),
      child: Row(
        children: [
          Text(
            DateTime.parse(releaseDate).year.toString(),
            style: StylesManager.textStyle20.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: SizeManager.s16),
          const MovieGenreItem(text: "U/A 16+"),
          const SizedBox(width: SizeManager.s16),
          Image.asset(AssetsManager.hd),
          const SizedBox(width: SizeManager.s1),
          Image.asset(AssetsManager.audio),
          const SizedBox(width: SizeManager.s5),
          Image.asset(AssetsManager.subtitles),
          const Spacer(),
          const StreamFlixMovieTag(),
        ],
      ),
    );
  }
}
