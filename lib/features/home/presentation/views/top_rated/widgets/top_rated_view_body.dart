import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../../core/common_widgets/line_spacer.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'top_rated_movies_grid_view_consumer.dart';

class TopRatedViewBody extends StatelessWidget {
  const TopRatedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(height: 10),
          LineSpacer(),
          SizedBox(height: SizeManager.s10),
          Text('Top Rated Movies', style: StylesManager.textStyle22),
          SizedBox(height: SizeManager.s10),
          TopRatedMoviesGridViewConsumer(),
        ],
      ),
    );
  }
}
