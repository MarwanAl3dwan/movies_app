import 'package:flutter/material.dart';

import 'now_playing_movies_section.dart';
import 'popular_movies_section.dart';
import 'top_rated_movies_section.dart';
import 'trending_now_movies_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: NowPlayingMoviesSection(),
        ),
        SliverToBoxAdapter(
          child: TrendingNowMoviesSection(),
        ),
        SliverToBoxAdapter(
          child: PopularMoviesSection(),
        ),
        SliverToBoxAdapter(
          child: TopRatedMoviesSection(),
        ),
      ],
    );
  }
}
