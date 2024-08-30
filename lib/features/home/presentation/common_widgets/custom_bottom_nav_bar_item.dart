import 'package:flutter/material.dart';

import '../../../../core/utils/styles_manager.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  const CustomBottomNavBarItem(
      {super.key, required this.text, required this.imagePath});

  final String text;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        Text(
          text,
          style: StylesManager.textStyle17.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
