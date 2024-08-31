import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/common_widgets/gesture_text.dart';
import '../../../../../../core/utils/app_router.dart';
import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';
import 'more_like_this_section_list.dart';

class MoreLikeThisSection extends StatelessWidget {
  const MoreLikeThisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: SizeManager.s14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('More Like This', style: StylesManager.textStyle22),
          const SizedBox(height: SizeManager.s10),
          const MoreLikeThisList(),
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

  void _navigateToPopularMoviesView(BuildContext context) {
    GoRouter.of(context).push(AppRouter.similarMoviesView);
  }
}
