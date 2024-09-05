import 'package:flutter/material.dart';

import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/size_manager.dart';
import 'person_search_list.dart';

class PersonSearchTabBarView extends StatefulWidget {
  const PersonSearchTabBarView({
    super.key,
  });

  @override
  State<PersonSearchTabBarView> createState() => _PersonSearchTabBarViewState();
}

class _PersonSearchTabBarViewState extends State<PersonSearchTabBarView> {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(SizeManager.s8),
    borderSide: const BorderSide(color: ColorsManager.secondary),
  );

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: SizeManager.s10),
        TextField(
          controller: controller,
          onChanged: searchForPerson,
          decoration: InputDecoration(
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            fillColor: ColorsManager.tertiary,
            filled: true,
          ),
        ),
        const SizedBox(height: SizeManager.s10),
        const PersonSearchList(),
      ],
    );
  }

  void searchForPerson(String query) {
    // if (query.isEmpty) {
    //   BlocProvider.of<SearchCubit>(context).emptySearch();
    // } else {
    //   BlocProvider.of<SearchCubit>(context).fetchSearchedMovies(query);
    // }
  }
}
