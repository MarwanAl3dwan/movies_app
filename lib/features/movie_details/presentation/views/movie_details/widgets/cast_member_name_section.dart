import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';

class CastMemberNameSection extends StatelessWidget {
  const CastMemberNameSection(
      {super.key, required this.name, required this.characterName});

  final String name;
  final String characterName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: SizeManager.s8, vertical: SizeManager.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: StylesManager.textStyle14.copyWith(
              color: ColorsManager.primary,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            characterName,
            style: StylesManager.textStyle13.copyWith(
              color: ColorsManager.primary,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
