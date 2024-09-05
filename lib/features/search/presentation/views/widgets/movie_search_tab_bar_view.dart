import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/size_manager.dart';
import '../../cubits/search_cubit.dart';
import 'search_field.dart';
import 'movie_search_grid_view_consumer.dart';

class MovieSearchTabBarView extends StatefulWidget {
  const MovieSearchTabBarView({super.key});

  @override
  State<MovieSearchTabBarView> createState() => _MovieSearchTabBarViewState();
}

class _MovieSearchTabBarViewState extends State<MovieSearchTabBarView> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: SizeManager.s10),
        SearchField(
          controller: controller,
          searchAction: searchForPerson,
        ),
        const SizedBox(height: SizeManager.s10),
        const MovieSearchGridViewConsumer(),
      ],
    );
  }

  void searchForPerson(String query) {
    if (query.isEmpty) {
      BlocProvider.of<SearchCubit>(context).emptySearch();
    } else {
      BlocProvider.of<SearchCubit>(context).fetchSearchedMovies(query);
    }
  }
}
