import 'package:flutter/material.dart';

import '../../../../../../core/common_widgets/custom_app_bar.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/size_manager.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            color: ColorsManager.red,
          ),
          const SizedBox(height: SizeManager.s10),
        ],
      ),
    );
  }
}
