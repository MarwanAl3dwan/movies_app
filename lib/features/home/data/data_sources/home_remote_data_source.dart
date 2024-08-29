import 'package:movies_app/core/utils/api_service.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieEntity>> fetchNowPlayingMovies();
  Future<List<MovieEntity>> fetchTrendingMovies();
  Future<List<MovieEntity>> fetchPopularMovies();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> fetchNowPlayingMovies() async {
    const nowPlayingMoviesEndPoint = '/movie/now_playing';
    Map<String, dynamic> data =
        await apiService.get(endPoint: nowPlayingMoviesEndPoint);
    List<MovieEntity> nowPlayingMoviesList = _getMoviesList(data);
    return nowPlayingMoviesList;
  }

  @override
  Future<List<MovieEntity>> fetchTrendingMovies() async {
    const timeWindow = 'day'; // 'day' or 'week'
    const trendingMoviesEndPoint = '/trending/movie/$timeWindow';
    Map<String, dynamic> data =
        await apiService.get(endPoint: trendingMoviesEndPoint);
    List<MovieEntity> trendingMoviesList = _getMoviesList(data);
    return trendingMoviesList;
  }

  @override
  Future<List<MovieEntity>> fetchPopularMovies() async {
    const popularMoviesEndPoint = '/movie/popular';
    Map<String, dynamic> data =
        await apiService.get(endPoint: popularMoviesEndPoint);
    List<MovieEntity> popularMoviesList = _getMoviesList(data);
    return popularMoviesList;
  }

  List<MovieEntity> _getMoviesList(Map<String, dynamic> data) {
    List<MovieEntity> movies = [];
    for (var movie in data['results']) {
      movies.add(MovieModel.fromJson(movie));
    }
    return movies;
  }
}
