import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/assets_manager.dart';
import '../utils/colors_manager.dart';
import '../utils/size_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeManager.s10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back, size: SizeManager.s45),
              color: ColorsManager.secondary,
            ),
            Image.asset(AssetsManager.profileImage),
          ],
        ),
      ),
    );
  }
}
