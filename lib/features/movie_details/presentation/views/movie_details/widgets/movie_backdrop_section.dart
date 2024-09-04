import 'package:flutter/material.dart';

import '../../../../../../core/utils/assets_manager.dart';

class MovieBackdropSection extends StatelessWidget {
  const MovieBackdropSection({super.key, required this.backdrop});

  final String backdrop;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.network(
        '${AssetsManager.imageUrl}$backdrop',
        fit: BoxFit.fill,
      ),
    );
  }
}
