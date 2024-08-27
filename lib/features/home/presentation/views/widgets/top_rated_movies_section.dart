import 'package:flutter/material.dart';

import '../../../../../core/utils/size_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import 'top_rated_movies_list.dart';

class TopRatedMoviesSection extends StatelessWidget {
  const TopRatedMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: SizeManager.s10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Rated Movies', style: StylesManager.textStyle22),
          SizedBox(height: SizeManager.s10),
          TopRatedMoviesList(),
          SizedBox(height: SizeManager.s12),
        ],
      ),
    );
  }
}
