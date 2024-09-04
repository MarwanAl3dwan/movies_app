import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'top_cast_billed_list.dart';

class TopCastBilledSection extends StatelessWidget {
  const TopCastBilledSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: SizeManager.s14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Cast Billed', style: StylesManager.textStyle22),
          SizedBox(height: SizeManager.s10),
          TopCastBilledList(),
          SizedBox(height: SizeManager.s4),
          // SizedBox(height: SizeManager.s10),
        ],
      ),
    );
  }
}