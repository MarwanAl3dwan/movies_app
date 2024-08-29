import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/size_manager.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, this.onTap, required this.movieEntity});

  final MovieEntity movieEntity;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToMovieDetailsView(context);
      },
      child: SizedBox(
        height: 210,
        child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SizeManager.s16),
            child: Image.network(
              '${AssetsManager.imageUrl}${movieEntity.moviePosterPath}',
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailsView(BuildContext context) {}
}
