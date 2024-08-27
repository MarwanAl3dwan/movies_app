import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/size_manager.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, this.onTap});

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
            child: Image.asset(AssetsManager.nowPlayingPoster),
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailsView(BuildContext context) {}
}
