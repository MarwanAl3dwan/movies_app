import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/home/widgets/now_playing_poster_item.dart';

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
              NowPlayingPosterList(),
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

class NowPlayingPosterList extends StatefulWidget {
  const NowPlayingPosterList({
    super.key,
  });

  @override
  State<NowPlayingPosterList> createState() => _NowPlayingPosterListState();
}

class _NowPlayingPosterListState extends State<NowPlayingPosterList> {
  late PageController _controller;
  late Timer _timer;
  int _currentPoster = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _currentPoster);
    initializeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 5,
      controller: _controller,
      itemBuilder: (context, index) {
        return const NowPlayingPosterItem();
      },
    );
  }

  void initializeTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPoster < 4) {
        _currentPoster++;
      } else {
        _currentPoster = 0;
      }

      _controller.animateToPage(
        _currentPoster,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent memory leaks
    _controller.dispose();
    super.dispose();
  }
}
