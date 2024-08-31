import 'package:flutter/material.dart';
import 'package:movies_app/core/common_widgets/custom_app_bar.dart';

import '../../../../../../core/common_widgets/line_spacer.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';

import 'trending_now_movies_grid_view_consumer.dart';

class TrendingNowViewBody extends StatelessWidget {
  const TrendingNowViewBody({super.key});

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
          Text('Trending Now', style: StylesManager.textStyle22),
          SizedBox(height: SizeManager.s10),
          TrendingNowMoviesGridViewConsumer(),
        ],
      ),
    );
  }
}
