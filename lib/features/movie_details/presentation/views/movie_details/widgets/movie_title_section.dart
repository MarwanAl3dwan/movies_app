import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';

class MovieTitleSection extends StatelessWidget {
  const MovieTitleSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s14),
      child: Wrap(
        alignment: WrapAlignment.start, // Align the wrap to start
        crossAxisAlignment:
            WrapCrossAlignment.start, // Align items to start of the cross axis
        children: [
          Text(
            title,
            style: StylesManager.textStyle32.copyWith(height: 1),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
