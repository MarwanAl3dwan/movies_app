import 'package:flutter/material.dart';

import '../utils/size_manager.dart';
import 'line_spacer.dart';

class HalfLineSpacer extends StatelessWidget {
  const HalfLineSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return LineSpacer(
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s14),
    );
  }
}