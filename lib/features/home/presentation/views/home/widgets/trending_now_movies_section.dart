import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'trending_now_list.dart';

class TrendingNowMoviesSection extends StatelessWidget {
  const TrendingNowMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: SizeManager.s10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trending Now', style: StylesManager.textStyle22),
          SizedBox(height: SizeManager.s10),
          TrendingNowList(),
          SizedBox(height: SizeManager.s12),
        ],
      ),
    );
  }
}
