import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/usecases/fetch_top_rated_movies_use_case.dart';
import 'package:movies_app/features/home/presentation/cubits/top_rated_movies_cubit/top_rated_movies_cubit.dart';

import '../../../../../core/utils/di.dart';
import 'widgets/top_rated_view_body.dart';

class TopRatedView extends StatelessWidget {
  const TopRatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TopRatedMoviesCubit>(
      create: (context) => TopRatedMoviesCubit(
        instance<FetchTopRatedMoviesUseCase>(),
      )..fetchTopRatedMovies(),
      child: const Scaffold(
        body: TopRatedViewBody(),
        // bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
