import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieEntity>> fetchNowPlayingMovies();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<MovieEntity>> fetchNowPlayingMovies() async {
    const nowPlayingMoviesEndPoint = '/now_playing';
    Map<String, dynamic> data =
        await _apiService.get(endPoint: nowPlayingMoviesEndPoint);
    List<MovieEntity> moviesList = _getMoviesList(data);
    return moviesList;
  }

  List<MovieEntity> _getMoviesList(Map<String, dynamic> data) {
    List<MovieEntity> movies = [];
    for (var movie in data['results']) {
      movies.add(MovieModel.fromJson(movie));
    }
    return movies;
  }
}
