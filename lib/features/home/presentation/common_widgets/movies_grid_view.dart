import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/size_manager.dart';
import '../../../../core/utils/styles_manager.dart';
import '../../../search/presentation/cubits/search_cubit.dart';
import '../../domain/entities/movie_entity.dart';
import 'movie_list_item.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key, required this.movies});

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Searching for '${BlocProvider.of<SearchCubit>(context).searchQuery}'",
              style: StylesManager.textStyle22),
          const SizedBox(height: SizeManager.s10),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: buildSliverGridDelegate(),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieListItem(movieEntity: movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  SliverGridDelegate buildSliverGridDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 1 / 1.5,
      crossAxisCount: 2,
      crossAxisSpacing: SizeManager.s12,
      mainAxisSpacing: SizeManager.s12,
    );
  }
}
