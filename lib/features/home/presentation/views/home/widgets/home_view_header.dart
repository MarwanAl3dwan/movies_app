import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'home_view_app_bar.dart';
import 'now_playing_poster_list_consumer.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.7,
          child: const Stack(
            children: [
              NowPlayingPosterListConsumer(),
              Column(
                children: [
                  HomeViewAppBar(),
                  Spacer(),
                  Text('Now Playing', style: StylesManager.textStyle32),
                  SizedBox(height: SizeManager.s10),
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
