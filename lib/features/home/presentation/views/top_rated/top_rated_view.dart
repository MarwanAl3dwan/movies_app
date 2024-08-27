import 'package:flutter/material.dart';

import '../common_widgets/custom_bottom_nav_bar.dart';
import 'widgets/top_rated_view_body.dart';

class TopRatedView extends StatelessWidget {
  const TopRatedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TopRatedViewBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
