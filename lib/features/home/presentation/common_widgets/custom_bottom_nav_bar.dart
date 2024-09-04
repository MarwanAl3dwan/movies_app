import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/colors_manager.dart';
import '../../../../core/utils/size_manager.dart';
import 'custom_bottom_nav_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeManager.s100,
      decoration: const BoxDecoration(
        color: ColorsManager.tertiary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeManager.s27),
          topRight: Radius.circular(SizeManager.s27),
        ),
      ),
      alignment: Alignment.center,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeManager.s8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBottomNavBarItem(
              text: "Home",
              imagePath: AssetsManager.home,
            ),
            CustomBottomNavBarItem(
              text: "Watchlist",
              imagePath: AssetsManager.plus,
            ),
            CustomBottomNavBarItem(
              text: "Library",
              imagePath: AssetsManager.cube,
            ),
            CustomBottomNavBarItem(
              text: "Downloads",
              imagePath: AssetsManager.scrollDown,
            ),
          ],
        ),
      ),
    );
  }
}
