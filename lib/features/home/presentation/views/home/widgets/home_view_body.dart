import 'package:flutter/material.dart';

import 'home_view_header.dart';
import 'home_view_section1.dart';
import 'home_view_section2.dart';
import 'home_view_section3.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: HomeViewHeader()),
        SliverToBoxAdapter(child: HomeViewSection1()),
        SliverToBoxAdapter(child: HomeViewSection2()),
        SliverToBoxAdapter(child: HomeViewSection3()),
      ],
    );
  }
}
