import 'package:flutter/material.dart';

import '../../../../home/domain/entities/movie_entity.dart';
import 'widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key, required this.movieEntity});

  final MovieEntity movieEntity;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MovieDetailsViewBody(movieEntity: widget.movieEntity),
    );
  }
}
