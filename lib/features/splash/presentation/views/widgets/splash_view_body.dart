import 'package:flutter/material.dart';

import '../../../../../core/utils/styles_manager.dart';
import 'splash_view_logo.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SplashViewLogo(),
          Text(
            'Your Ultimate Movie Experience',
            style: StylesManager.textStyle20,
          ),
        ],
      ),
    );
  }
}
