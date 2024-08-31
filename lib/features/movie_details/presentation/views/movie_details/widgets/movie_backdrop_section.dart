import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_manager.dart';

class MovieBackdropSection extends StatelessWidget {
  const MovieBackdropSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.asset(AssetsManager.backdrop, fit: BoxFit.cover),
      // child: Image.network(
      //   '${AssetsManager.imageUrl}$backdrop',
      //   fit: BoxFit.fill,
      // ),
    );
  }
}
