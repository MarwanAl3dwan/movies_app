import 'package:flutter/material.dart';

import 'widgets/similar_movies_view_body.dart';

class SimilarMoviesView extends StatelessWidget {
  const SimilarMoviesView({super.key, required this.extraParam});

  final Object? extraParam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimilarMoviesViewBody(movieId: extraParam as int),
    );
  }
}
