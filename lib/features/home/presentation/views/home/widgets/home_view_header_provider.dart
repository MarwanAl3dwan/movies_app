import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/cubits/now_playing_movies_cubit/now_playing_movies_cubit.dart';

import '../../../../../../core/utils/di.dart';

import '../../../../domain/usecases/fetch_now_playing_movies_use_case.dart';
import 'home_view_header.dart';

class HomeViewHeaderProvider extends StatelessWidget {
  const HomeViewHeaderProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NowPlayingMoviesCubit>(
      create: (context) => NowPlayingMoviesCubit(
        instance<FetchNowPlayingMoviesUseCase>(),
      )..fetchNowPlayingMovies(),
      child: const HomeViewHeader(),
    );
  }
}
