import 'package:flutter/material.dart';

import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/size_manager.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
    required this.controller,
    this.searchAction,
  });

  final TextEditingController controller;
  final Function(String)? searchAction;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(SizeManager.s8),
    borderSide: const BorderSide(color: ColorsManager.secondary),
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.searchAction,
      decoration: InputDecoration(
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        fillColor: ColorsManager.tertiary,
        filled: true,
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
