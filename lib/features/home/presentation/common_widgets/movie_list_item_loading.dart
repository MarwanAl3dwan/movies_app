import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/size_manager.dart';

class MovieListItemLoading extends StatelessWidget {
  const MovieListItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeManager.s210,
      child: AspectRatio(
        aspectRatio: 1 / 1.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SizeManager.s16),
          child: Shimmer.fromColors(
            baseColor: ColorsManager.loadingColor[700]!,
            highlightColor: ColorsManager.loadingColor[900]!,
            child: Container(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
