import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_manager.dart';
import '../../../../../../core/utils/styles_manager.dart';

class MovieOverviewSection extends StatelessWidget {
  const MovieOverviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeManager.s14),
      child: Text(
        'A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.',
        style: StylesManager.textStyle20,
      ),
    );
  }
}
