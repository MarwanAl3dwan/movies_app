import 'package:flutter/material.dart';

import '../../../../../core/utils/size_manager.dart';
import 'movie_list_item_loading.dart';

class MoviesGridViewLoading extends StatelessWidget {
  const MoviesGridViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: buildSliverGridDelegate(),
        itemCount: 15,
        itemBuilder: (context, index) {
          return const MovieListItemLoading();
        },
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
