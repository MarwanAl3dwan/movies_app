import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles_manager.dart';

class MovieLanguage extends StatelessWidget {
  const MovieLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Lang: ', style: StylesManager.textStyle20),
        CountryFlag.fromLanguageCode(
          'en',
          height: 25,
          width: 45,
        ),
      ],
    );
  }
}