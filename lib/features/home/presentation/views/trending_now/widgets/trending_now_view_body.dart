import 'package:flutter/material.dart';
import 'package:movies_app/core/common_widgets/custom_app_bar.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';

class TrendingNowViewBody extends StatelessWidget {
  const TrendingNowViewBody({super.key});

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
          const Text('Trending Now', style: StylesManager.textStyle22),
          const SizedBox(height: SizeManager.s10),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.5,
                crossAxisCount: 3,
                crossAxisSpacing: SizeManager.s12,
                mainAxisSpacing: SizeManager.s12,
              ),
              itemCount: 18,
              itemBuilder: (context, index) {
                // return const MovieListItem();
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
