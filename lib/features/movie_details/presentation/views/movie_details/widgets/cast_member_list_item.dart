import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../domain/entities/cast_member_entity.dart';
import 'cast_member_name_section.dart';

class CastMemberListItem extends StatelessWidget {
  const CastMemberListItem({super.key, required this.castMember});

  final CastMemberEntity castMember;

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
        height: SizeManager.s210,
        width: SizeManager.s140,
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
                  child: Image.network(
                    '${AssetsManager.imageUrl}${castMember.memberProfilePath}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: ColorsManager.secondary,
                  child: CastMemberNameSection(
                    name: castMember.memberName,
                    characterName: castMember.characterName,
                  ),
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
