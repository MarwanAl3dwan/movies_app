import 'package:flutter/material.dart';

class NowPlayingPosterItem extends StatelessWidget {
  const NowPlayingPosterItem({super.key, required this.posterPath});

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.65,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.7,
        width: MediaQuery.of(context).size.width,
        child: Image.network(
          'https://image.tmdb.org/t/p/w500$posterPath',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
