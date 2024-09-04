import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../../core/common_widgets/line_spacer.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'similar_movies_grid_view_consumer.dart';

class SimilarMoviesViewBody extends StatelessWidget {
  const SimilarMoviesViewBody({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SizedBox(height: SizeManager.s10),
          const LineSpacer(),
          const SizedBox(height: SizeManager.s10),
          const Text('More Like This', style: StylesManager.textStyle22),
          const SizedBox(height: SizeManager.s10),
          SimilarMoviesGridViewConsumer(movieId: movieId),
        ],
      ),
    );
  }
}
