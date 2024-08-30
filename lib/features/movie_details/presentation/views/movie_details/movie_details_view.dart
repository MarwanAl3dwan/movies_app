import 'package:flutter/material.dart';

import 'widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovieDetailsViewBody(),
    );
  }
}
