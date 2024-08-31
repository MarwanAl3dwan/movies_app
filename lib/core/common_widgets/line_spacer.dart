import 'package:flutter/material.dart';

import '../utils/colors_manager.dart';

class LineSpacer extends StatelessWidget {
  const LineSpacer({super.key, this.width, this.color, this.padding});

  final double? width;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: 2,
        color: color ?? ColorsManager.red,
      ),
    );
  }
}
