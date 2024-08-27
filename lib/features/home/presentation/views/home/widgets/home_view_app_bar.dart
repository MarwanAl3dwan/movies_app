import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/size_manager.dart';

import '../../../../../../core/utils/assets_manager.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeManager.s10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AssetsManager.splashLogo),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: SizeManager.s50,
                    color: ColorsManager.secondary,
                  ),
                ),
                Image.asset(AssetsManager.profileImage),
              ],
            )
          ],
        ),
      ),
    );
  }
}
