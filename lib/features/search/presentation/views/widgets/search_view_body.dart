import 'package:flutter/material.dart';

import '../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../core/common_widgets/line_spacer.dart';
import '../../../../../core/utils/colors_manager.dart';
import 'movie_search_tab_bar_view.dart';
import 'person_search_tab_bar_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const LineSpacer(),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: "Movie"),
              Tab(text: "Person"),
            ],
            indicatorColor: ColorsManager.red,
            labelColor: ColorsManager.secondary,
            unselectedLabelColor: ColorsManager.loadingColor,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                MovieSearchTabBarView(),
                PersonSearchTabBarView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
