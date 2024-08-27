import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/styles_manager.dart';

import '../../../../../core/utils/size_manager.dart';

class SplashViewLogo extends StatelessWidget {
  const SplashViewLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Image.asset(AssetsManager.splashLogo),
        Padding(
          padding: const EdgeInsets.only(
              left: SizeManager.s55, top: SizeManager.s25),
          child: Text(
            'T R E A M F L I X',
            style: StylesManager.textStyle24.copyWith(color: ColorsManager.red),
          ),
        ),
      ],
    );
  }
}
