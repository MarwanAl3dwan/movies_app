import 'package:flutter/material.dart';

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
        height: 35,
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

  String getGenre(int code) {
    switch (code) {
      case 28:
        return 'Action';
      case 12:
        return 'Adventure';
      case 16:
        return 'Animation';
      case 35:
        return 'Comedy';
      case 80:
        return 'Crime';
      case 99:
        return 'Documentary';
      case 18:
        return 'Drama';
      case 10751:
        return 'Family';
      case 14:
        return 'Fantasy';
      case 36:
        return 'History';
      case 27:
        return 'Horror';
      case 10402:
        return 'Music';
      case 9648:
        return 'Mystery';
      case 10749:
        return 'Romance';
      case 878:
        return 'Science Fiction';
      case 10770:
        return 'TV Movie';
      case 53:
        return 'Thriller';
      case 10752:
        return 'War';
      case 37:
        return 'Western';
      default:
        return 'Drama';
    }
  }
}
