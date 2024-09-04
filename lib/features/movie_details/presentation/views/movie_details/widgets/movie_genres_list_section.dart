import 'package:flutter/material.dart';

import '../../../../../../core/utils/functions.dart';
import '../../../../../../core/utils/size_manager.dart';
import 'movie_genre_item.dart';

class MovieGenresListSection extends StatelessWidget {
  const MovieGenresListSection({super.key, required this.genres});

  final List<int> genres;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s14),
      child: SizedBox(
        height: SizeManager.s35,
        child: ListView.builder(
          itemCount: genres.length,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: SizeManager.s5),
              child: MovieGenreItem(text: getGenre(genres[index])),
            );
          },
        ),
      ),
    );
  }
}
