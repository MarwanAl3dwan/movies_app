import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';

class MovieOverviewSection extends StatelessWidget {
  const MovieOverviewSection({super.key, required this.overview});

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s14),
      child: Text(
        overview,
        style: StylesManager.textStyle20,
      ),
    );
  }
}
