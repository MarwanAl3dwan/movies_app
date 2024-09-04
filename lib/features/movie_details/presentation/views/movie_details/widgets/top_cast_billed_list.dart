import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../domain/entities/cast_member_entity.dart';
import 'cast_member_list_item.dart';

class TopCastBilledList extends StatelessWidget {
  const TopCastBilledList({super.key, required this.castMembers});

  final List<CastMemberEntity> castMembers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: castMembers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: SizeManager.s16),
            child: CastMemberListItem(castMember: castMembers[index]),
          );
        },
      ),
    );
  }
}
