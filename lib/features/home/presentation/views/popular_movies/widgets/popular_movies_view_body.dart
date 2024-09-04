import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../../core/common_widgets/line_spacer.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'popular_movies_grid_view_consumer.dart';

class PopularMoviesViewBody extends StatelessWidget {
  const PopularMoviesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(height: SizeManager.s10),
          LineSpacer(),
          SizedBox(height: SizeManager.s10),
          Text('Popular Movies', style: StylesManager.textStyle22),
          SizedBox(height: SizeManager.s10),
          PopularMoviesGridViewConsumer(),
        ],
      ),
    );
  }

  SliverGridDelegate buildSliverGridDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 1 / 1.5,
      crossAxisCount: 3,
      crossAxisSpacing: SizeManager.s12,
      mainAxisSpacing: SizeManager.s12,
    );
  }
}
