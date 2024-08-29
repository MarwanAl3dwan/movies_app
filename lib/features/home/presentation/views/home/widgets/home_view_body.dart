import 'package:flutter/material.dart';

import 'home_view_header_provider.dart';
import 'home_view_section2_provider.dart';
import 'home_view_section3_provider.dart';
import 'home_view_section1_provider.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HomeViewHeaderProvider()),
        SliverToBoxAdapter(child: HomeViewSection1Provider()),
        SliverToBoxAdapter(child: HomeViewSection2Provider()),
        SliverToBoxAdapter(child: HomeViewSection3Provider()),
      ],
    );
  }
}
