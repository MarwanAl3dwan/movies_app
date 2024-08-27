import 'package:flutter/material.dart';

import '../common_widgets/custom_bottom_nav_bar.dart';
import 'widgets/trending_now_view_body.dart';

class TrendingNowView extends StatelessWidget {
  const TrendingNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TrendingNowViewBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
