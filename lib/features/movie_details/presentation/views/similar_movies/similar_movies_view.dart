import 'package:flutter/material.dart';

import 'widgets/similar_movies_view_body.dart';

class SimilarMoviesView extends StatelessWidget {
  const SimilarMoviesView({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimilarMoviesViewBody(movieId: movieId),
    );
  }
}
