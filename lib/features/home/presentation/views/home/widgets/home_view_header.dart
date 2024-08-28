import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/home/widgets/now_playing_poster_list_bloc_consumer.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'home_view_app_bar.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 1.7,
          child: const Stack(
            children: [
              NowPlayingPosterListBlocConsumer(),
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
