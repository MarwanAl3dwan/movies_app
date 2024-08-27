import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'home_view_app_bar.dart';
import 'now_playing_poster.dart';

class NowPlayingMoviesSection extends StatelessWidget {
  const NowPlayingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.7,
          child: const Stack(
            children: [
              NowPlayingPoster(),
              Column(
                children: [
                  HomeViewAppBar(),
                  Spacer(),
                  Text('Now Playing', style: StylesManager.textStyle32),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: SizeManager.s12),
      ],
    );
  }
}
