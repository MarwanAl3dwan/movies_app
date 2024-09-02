import 'package:flutter/material.dart';

import 'widgets/similar_movies_view_body.dart';

class SimilarMoviesView extends StatelessWidget {
  const SimilarMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SimilarMoviesViewBody(),
    );
  }
}
