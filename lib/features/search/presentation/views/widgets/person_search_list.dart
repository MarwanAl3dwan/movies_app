import 'package:flutter/material.dart';

import '../../../../../core/utils/size_manager.dart';
import 'person_search_list_item.dart';

class PersonSearchList extends StatelessWidget {
  const PersonSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(
              bottom: SizeManager.s12,
              left: SizeManager.s10,
              right: SizeManager.s10,
            ),
            child: PersonSearchListItem(),
          );
        },
      ),
    );
  }
}