import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../common_widgets/movie_list_item.dart';

class HomeViewSection1List extends StatelessWidget {
  const HomeViewSection1List({super.key, required this.movies});

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: SizeManager.s16),
            child: MovieListItem(movieEntity: movies[index]),
          );
        },
      ),
    );
  }
}
