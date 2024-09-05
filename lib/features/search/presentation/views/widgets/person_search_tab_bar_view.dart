import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/common_widgets/movies_grid_view_loading.dart';

import '../../../../../core/utils/colors_manager.dart';
import '../../../../../core/utils/size_manager.dart';
import '../../../domain/entities/person_entity.dart';
import '../../cubits/person_search_cubit/person_search_cubit.dart';
import 'person_search_list.dart';

class PersonSearchTabBarView extends StatefulWidget {
  const PersonSearchTabBarView({super.key});

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
        const PersonSearchListConsumer(),
      ],
    );
  }

  void searchForPerson(String query) {
    if (query.isEmpty) {
      BlocProvider.of<PersonSearchCubit>(context).emptySearch();
    } else {
      BlocProvider.of<PersonSearchCubit>(context).fetchPersonSearch(query);
    }
  }
}

class PersonSearchListConsumer extends StatefulWidget {
  const PersonSearchListConsumer({super.key});

  @override
  State<PersonSearchListConsumer> createState() =>
      _PersonSearchListConsumerState();
}

class _PersonSearchListConsumerState extends State<PersonSearchListConsumer> {
  final List<PersonEntity> persons = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonSearchCubit, PersonSearchState>(
      listener: (context, state) {
        if (state is PersonSearchSuccess) {
          persons.clear();
          persons.addAll(state.persons);
        }
      },
      builder: (context, state) {
        if (state is PersonSearchSuccess) {
          return PersonSearchList(persons: persons);
        } else if (state is PersonSearchFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is PersonSearchEmpty || state is PersonSearchInitial) {
          return const SizedBox();
        } else {
          return const MoviesGridViewLoading();
        }
      },
    );
  }
}
