import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../home/domain/entities/movie_entity.dart';
import '../../../../../home/presentation/common_widgets/movie_list_item.dart';

class MoreLikeThisList extends StatelessWidget {
  const MoreLikeThisList({
    super.key,
    required this.movies,
  });

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeManager.s210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (movies.length / 2).floor(),
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
