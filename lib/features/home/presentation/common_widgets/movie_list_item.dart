import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/features/movie_details/presentation/cubits/similar_movies_cubit/similar_movies_cubit.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/size_manager.dart';
import '../../../movie_details/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import '../../domain/entities/movie_entity.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, this.onTap, required this.movieEntity});

  final MovieEntity movieEntity;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToMovieDetailsView(context);
      },
      child: Container(
        height: 210,
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.secondary, width: 0.2),
          borderRadius: BorderRadius.circular(SizeManager.s16),
        ),
        child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SizeManager.s16),
            child: Image.network(
              '${AssetsManager.imageUrl}${movieEntity.moviePosterPath}',
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetailsView(BuildContext context) {
    GoRouter.of(context).push(AppRouter.movieDetailsView);

    BlocProvider.of<MovieDetailsCubit>(context)
        .fetchMovieDetails(movieEntity.movieId);

    BlocProvider.of<SimilarMoviesCubit>(context)
        .fetchSimilarMovies(movieEntity.movieId);
  }
}
