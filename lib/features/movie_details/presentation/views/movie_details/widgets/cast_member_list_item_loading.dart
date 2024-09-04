import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/size_manager.dart';

class CastMemberListItemLoading extends StatelessWidget {
  const CastMemberListItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: AspectRatio(
        aspectRatio: 1 / 1.5,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(SizeManager.s16),
            topRight: Radius.circular(SizeManager.s16),
          ),
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
