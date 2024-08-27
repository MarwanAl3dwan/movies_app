import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../common_widgets/movie_list_item.dart';

class HomeViewSection2List extends StatelessWidget {
  const HomeViewSection2List({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: SizeManager.s16),
            child: MovieListItem(),
          );
        },
      ),
    );
  }
}
