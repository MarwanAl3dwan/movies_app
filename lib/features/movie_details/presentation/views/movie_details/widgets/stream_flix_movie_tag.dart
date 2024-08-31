import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_manager.dart';
import '../../../../../../core/utils/size_manager.dart';

class StreamFlixMovieTag extends StatelessWidget {
  const StreamFlixMovieTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AssetsManager.splashLogo, width: 30),
        const SizedBox(width: SizeManager.s3),
        const Text('M  O  V  I  E'),
      ],
    );
  }
}