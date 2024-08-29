import 'package:flutter/material.dart';

import 'widgets/popular_movies_view_body.dart';

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PopularMoviesViewBody(),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
