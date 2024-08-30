import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/size_manager.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, this.onTap, required this.movieEntity});

  final MovieEntity movieEntity;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToMovieDetailsView(context);
        _callProviderToFetchMovieDataFromApi();
      },
      child: Container(
        height: 210,
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.secondary, width: 0.2),
          borderRadius: BorderRadius.circular(SizeManager.s16),
        ),
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

  void _navigateToMovieDetailsView(BuildContext context) {
    GoRouter.of(context).push(AppRouter.movieDetailsView);
  }

  void _callProviderToFetchMovieDataFromApi() {}
}
