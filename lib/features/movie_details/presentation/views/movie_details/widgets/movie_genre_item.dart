import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';

class MovieGenreItem extends StatelessWidget {
  const MovieGenreItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorsManager.tertiary,
          borderRadius: BorderRadius.circular(SizeManager.s8)),
      child: Padding(
        padding: const EdgeInsets.all(SizeManager.s4),
        child: Text(text, style: StylesManager.textStyle18),
      ),
    );
  }
}
