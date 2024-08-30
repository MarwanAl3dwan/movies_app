import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../../core/utils/assets_manager.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        MovieBackdropSection(),
      ],
    );
  }
}

class MovieBackdropSection extends StatelessWidget {
  const MovieBackdropSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.asset(AssetsManager.backdrop),
      // child: Image.network(
      //   '${AssetsManager.imageUrl}$backdrop',
      //   fit: BoxFit.fill,
      // ),
    );
  }
}
