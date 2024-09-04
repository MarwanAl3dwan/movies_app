import 'package:flutter/material.dart';

import '../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../core/common_widgets/line_spacer.dart';
import '../../../../../core/utils/size_manager.dart';
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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(height: 10),
          SearchField(),
          SizedBox(height: 10),
          LineSpacer(),
          SizedBox(height: SizeManager.s10),
          SearchMoviesGridViewConsumer(),
        ],
      ),
    );
  }
}
