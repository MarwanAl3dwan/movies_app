import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/di.dart';
import '../../../../domain/usecases/fetch_now_playing_movies_use_case.dart';
import '../../../cubits/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'home_view_header.dart';
import 'home_view_section2.dart';
import 'home_view_section3.dart';
import 'home_view_section1.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => NowPlayingMoviesCubit(
              instance<FetchNowPlayingMoviesUseCase>(),
            )..fetchNowPlayingMovies(),
            child: const HomeViewHeader(),
          ),
        ),
        const SliverToBoxAdapter(
          child: HomeViewSection1(),
        ),
        const SliverToBoxAdapter(
          child: HomeViewSection2(),
        ),
        const SliverToBoxAdapter(
          child: HomeViewSection3(),
        ),
      ],
    );
  }
}
