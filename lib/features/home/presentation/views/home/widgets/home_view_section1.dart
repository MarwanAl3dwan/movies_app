import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/utils/app_router.dart';

import '../../../../../../core/common_widgets/gesture_text.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'home_view_section1_consumer.dart';

class HomeViewSection1 extends StatelessWidget {
  const HomeViewSection1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: SizeManager.s10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Trending Now', style: StylesManager.textStyle22),
          const SizedBox(height: SizeManager.s10),
          const HomeViewSection1Consumer(),
          const SizedBox(height: SizeManager.s4),
          GestureText(
              text: 'See More',
              onTap: () => _navigateToTrendingNowView(context)),
          const SizedBox(height: SizeManager.s10),
        ],
      ),
    );
  }

  void _navigateToTrendingNowView(BuildContext context) {
    GoRouter.of(context).push(AppRouter.trendingNowView);
  }
}
