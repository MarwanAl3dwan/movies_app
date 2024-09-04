import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../common_widgets/movie_list_item_loading.dart';

class HomeViewSection3LoadingList extends StatelessWidget {
  const HomeViewSection3LoadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeManager.s210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: SizeManager.s16),
            child: MovieListItemLoading(),
          );
        },
      ),
    );
  }
}
