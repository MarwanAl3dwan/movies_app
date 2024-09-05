import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/size_manager.dart';
import '../../../../../core/utils/styles_manager.dart';

class PersonSearchListItem extends StatelessWidget {
  const PersonSearchListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.white,
          height: SizeManager.s85,
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.asset(
              AssetsManager.nowPlayingPoster,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: SizeManager.s16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Jason Statham', style: StylesManager.textStyle22),
              const SizedBox(height: SizeManager.s6),
              Wrap(
                children: [
                  Text(
                    'Acting \u2022 Transporter, Wrath of Man, The Meg',
                    style: StylesManager.textStyle17.copyWith(height: 1),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
