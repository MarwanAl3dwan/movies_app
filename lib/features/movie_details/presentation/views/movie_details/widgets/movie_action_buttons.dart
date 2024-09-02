import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';

class MovieActionButtons extends StatelessWidget {
  const MovieActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Image.asset(AssetsManager.plusMath),
            const Text('My List', style: StylesManager.textStyle17),
          ],
        ),
        Column(
          children: [
            Image.asset(AssetsManager.share),
            const Text('Share', style: StylesManager.textStyle17),
          ],
        ),
      ],
    );
  }
}
