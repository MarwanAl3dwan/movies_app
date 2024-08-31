import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import 'movie_genre_item.dart';

class MovieGenresList extends StatelessWidget {
  const MovieGenresList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s14),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: SizeManager.s5),
              child: MovieGenreItem(text: "Drama"),
            );
          },
        ),
      ),
    );
  }
}
