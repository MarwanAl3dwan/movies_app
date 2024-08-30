import 'package:flutter/material.dart';

import 'widgets/trending_now_view_body.dart';

class TrendingNowView extends StatelessWidget {
  const TrendingNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TrendingNowViewBody(),
    );
  }
}
