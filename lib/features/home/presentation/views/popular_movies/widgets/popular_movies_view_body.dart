import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'popular_movies_grid_view_consumer.dart';

class PopularMoviesViewBody extends StatelessWidget {
  const PopularMoviesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: ColorsManager.red,
          ),
          const SizedBox(height: SizeManager.s10),
          const Text('Popular Movies', style: StylesManager.textStyle22),
          const SizedBox(height: SizeManager.s10),
          const PopularMoviesGridViewConsumer(),
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
