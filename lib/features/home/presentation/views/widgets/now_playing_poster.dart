import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';

class NowPlayingPoster extends StatelessWidget {
  const NowPlayingPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.65,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.7,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          AssetsManager.nowPlayingPoster,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
