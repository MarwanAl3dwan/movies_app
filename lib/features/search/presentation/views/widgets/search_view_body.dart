import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../core/common_widgets/line_spacer.dart';
import '../../../../../core/utils/size_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../cubits/search_cubit.dart';
import 'search_field.dart';
import 'search_movies_grid_view_consumer.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SizedBox(height: 10),
          const SearchField(),
          const SizedBox(height: 10),
          const LineSpacer(),
          Text(
              "Searching for '${BlocProvider.of<SearchCubit>(context).searchQuery}'",
              style: StylesManager.textStyle22),
          const SizedBox(height: SizeManager.s10),
          const SearchMoviesGridViewConsumer(),
        ],
      ),
    );
  }
}
