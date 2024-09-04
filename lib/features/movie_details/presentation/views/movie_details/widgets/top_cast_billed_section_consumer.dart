import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/cast_member_entity.dart';
import '../../../cubits/cast_members_cubit/cast_members_cubit.dart';
import 'top_cast_billed_loading_section.dart';
import 'top_cast_billed_section.dart';

class TopCastBilledSectionConsumer extends StatefulWidget {
  const TopCastBilledSectionConsumer({super.key, required this.movieId});

  final int movieId;

  @override
  State<TopCastBilledSectionConsumer> createState() =>
      _TopCastBilledSectionConsumerState();
}

class _TopCastBilledSectionConsumerState
    extends State<TopCastBilledSectionConsumer> {
  final List<CastMemberEntity> castMembers = [];

  @override
  void initState() {
    BlocProvider.of<CastMembersCubit>(context).fetchCastMembers(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CastMembersCubit, CastMembersState>(
      listener: (context, state) {
        if (state is CastMembersSuccess) {
          castMembers.addAll(state.castMembers);
        }
      },
      builder: (context, state) {
        if (state is CastMembersSuccess) {
          return TopCastBilledSection(castMembers: castMembers);
        } else if (state is CastMembersFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const TopCastBilledLoadingSection();
        }
      },
    );
  }
}
