import 'package:flutter/material.dart';

import '../utils/size_manager.dart';

class GestureText extends StatelessWidget {
  const GestureText({
    super.key,
    required this.text,
    this.onTap,
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: SizeManager.s6),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
