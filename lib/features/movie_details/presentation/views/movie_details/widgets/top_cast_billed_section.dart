import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import '../../../../domain/entities/cast_member_entity.dart';
import 'top_cast_billed_list.dart';

class TopCastBilledSection extends StatelessWidget {
  const TopCastBilledSection({super.key, required this.castMembers});

  final List<CastMemberEntity> castMembers;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: SizeManager.s14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Top Cast Billed', style: StylesManager.textStyle22),
          const SizedBox(height: SizeManager.s10),
          TopCastBilledList(castMembers: castMembers),
          const SizedBox(height: SizeManager.s4),
          // SizedBox(height: SizeManager.s10),
        ],
      ),
    );
  }
}
