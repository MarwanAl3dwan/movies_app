import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/size_manager.dart';
import '../../cubits/search_cubit.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
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
    return TextField(
      controller: controller,
      autofocus: true,
      onChanged: searchForMovie,
      decoration: InputDecoration(
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        fillColor: ColorsManager.tertiary,
        filled: true,
      ),
    );
  }

  void searchForMovie(String query) {
    if (query.isEmpty) {
      BlocProvider.of<SearchCubit>(context).emptySearch();
    } else {
      BlocProvider.of<SearchCubit>(context).fetchSearchedMovies(query);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
