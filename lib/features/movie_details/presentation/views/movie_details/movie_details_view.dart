import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:movies_app/features/movie_details/presentation/cubits/movie_details_cubit.dart';

import 'widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  MovieEntity? movieEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
        listener: (context, state) {
          if (state is MovieDetailsSuccess) {
            movieEntity = state.movieEntity;
          }
        },
        builder: (context, state) {
          if (state is MovieDetailsSuccess) {
            return MovieDetailsViewBody(movieEntity: movieEntity!);
          } else if (state is MovieDetailsFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
