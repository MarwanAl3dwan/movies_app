import 'package:flutter/material.dart';

import '../../../../core/utils/size_manager.dart';
import '../../domain/entities/movie_entity.dart';
import 'movie_list_item.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key, required this.movies});

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: buildSliverGridDelegate(),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieListItem(movieEntity: movies[index]);
        },
      ),
    );
  }

  SliverGridDelegate buildSliverGridDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 1 / 1.5,
      crossAxisCount: 2,
      crossAxisSpacing: SizeManager.s12,
      mainAxisSpacing: SizeManager.s12,
    );
  }
}
