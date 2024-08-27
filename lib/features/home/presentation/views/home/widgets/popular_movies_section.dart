import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'popular_movies_list.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: SizeManager.s10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular Movies', style: StylesManager.textStyle22),
          SizedBox(height: SizeManager.s10),
          PopularMoviesList(),
          SizedBox(height: SizeManager.s12),
        ],
      ),
    );
  }
}
