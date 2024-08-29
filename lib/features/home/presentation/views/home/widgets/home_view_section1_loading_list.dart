import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/home/widgets/movie_list_item_loading.dart';

import '../../../../../../core/utils/size_manager.dart';

class HomeViewSection1LoadingList extends StatelessWidget {
  const HomeViewSection1LoadingList({super.key});

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
            child: MovieListItemLoading(),
          );
        },
      ),
    );
  }
}
