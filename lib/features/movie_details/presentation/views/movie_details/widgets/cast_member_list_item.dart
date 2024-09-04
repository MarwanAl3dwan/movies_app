import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/size_manager.dart';
import 'cast_member_name_section.dart';

class CastMemberListItem extends StatelessWidget {
  const CastMemberListItem({super.key});

  final BorderRadiusGeometry topRadius = const BorderRadius.only(
    topLeft: Radius.circular(SizeManager.s16),
    topRight: Radius.circular(SizeManager.s16),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToMovieDetailsView(context);
      },
      child: Container(
        height: 210,
        width: 140,
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.secondary, width: 0.2),
          borderRadius: topRadius,
        ),
        child: ClipRRect(
          borderRadius: topRadius,
          child: Column(
            children: [
              Flexible(
                flex: 6,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    AssetsManager.castMemberPoster,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: ColorsManager.secondary,
                  child: const CastMemberNameSection(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailsView(BuildContext context) {}
}
