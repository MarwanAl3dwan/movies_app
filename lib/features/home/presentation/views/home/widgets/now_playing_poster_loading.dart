import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/utils/colors_manager.dart';

class NowPlayingPosterLoading extends StatelessWidget {
  const NowPlayingPosterLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.7,
      width: MediaQuery.of(context).size.width,
      child: SizedBox(
        child: Shimmer.fromColors(
          baseColor: ColorsManager.loadingColor[700]!,
          highlightColor: ColorsManager.loadingColor[900]!,
          child: Container(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
