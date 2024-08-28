import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

import 'now_playing_poster_item.dart';

class NowPlayingPosterList extends StatefulWidget {
  const NowPlayingPosterList({
    super.key,
    required this.movies,
  });

  final List<MovieEntity> movies;

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
      itemCount: widget.movies.length,
      controller: _controller,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return NowPlayingPosterItem(
          posterPath: widget.movies[index].moviePosterPath,
        );
      },
    );
  }

  void initializeTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPoster < widget.movies.length - 1) {
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
