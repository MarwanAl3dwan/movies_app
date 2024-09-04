import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'more_like_this_loading_list.dart';

class MoreLikeThisLoadingSection extends StatelessWidget {
  const MoreLikeThisLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: SizeManager.s14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('More Like This', style: StylesManager.textStyle22),
          SizedBox(height: SizeManager.s10),
          MoreLikeThisLoadingList(),
          SizedBox(height: SizeManager.s4),
          Align(alignment: Alignment.centerRight, child: Text('See More')),
          SizedBox(height: SizeManager.s10),
        ],
      ),
    );
  }
}
