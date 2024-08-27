import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/gesture_text.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'home_view_section2_list.dart';

class HomeViewSection2 extends StatelessWidget {
  const HomeViewSection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: SizeManager.s10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Popular Movies', style: StylesManager.textStyle22),
          const SizedBox(height: SizeManager.s10),
          const HomeViewSection2List(),
          const SizedBox(height: SizeManager.s4),
          GestureText(
            text: 'See More',
            onTap: () => _navigateToPopularMoviesView(context),
          ),
          const SizedBox(height: SizeManager.s10),
        ],
      ),
    );
  }

  void _navigateToPopularMoviesView(BuildContext context) {}
}
