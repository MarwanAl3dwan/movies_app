import 'package:flutter/material.dart';

import '../../../../../home/presentation/common_widgets/movies_grid_view_loading.dart';

class SimilarMoviesGridView extends StatelessWidget {
  const SimilarMoviesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    // return const movies();
    return const MoviesGridViewLoading();
  }
}
