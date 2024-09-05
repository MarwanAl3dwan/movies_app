import 'package:flutter/material.dart';

import '../../../../../core/utils/size_manager.dart';
import '../../../domain/entities/person_entity.dart';
import 'person_search_list_item.dart';

class PersonSearchList extends StatelessWidget {
  const PersonSearchList({super.key, required this.persons});

  final List<PersonEntity> persons;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: SizeManager.s10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: persons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: SizeManager.s12,
                    left: SizeManager.s10,
                    right: SizeManager.s10,
                  ),
                  child: PersonSearchListItem(personEntity: persons[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
