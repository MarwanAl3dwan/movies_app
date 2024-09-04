import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/functions.dart';
import '../../domain/entities/movie_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieEntity>> fetchNowPlayingMovies();
  Future<List<MovieEntity>> fetchTrendingMovies();
  Future<List<MovieEntity>> fetchPopularMovies();
  Future<List<MovieEntity>> fetchTopRatedMovies();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> fetchNowPlayingMovies() async {
    const nowPlayingMoviesEndPoint = '/movie/now_playing';
    Map<String, dynamic> data =
        await apiService.get(endPoint: nowPlayingMoviesEndPoint);
    List<MovieEntity> nowPlayingMoviesList = getMoviesList(data);
    return nowPlayingMoviesList;
  }

  @override
  Future<List<MovieEntity>> fetchTrendingMovies() async {
    const timeWindow = 'week'; // 'day' or 'week'
    const trendingMoviesEndPoint = '/trending/movie/$timeWindow';
    Map<String, dynamic> data =
        await apiService.get(endPoint: trendingMoviesEndPoint);
    List<MovieEntity> trendingMoviesList = getMoviesList(data);
    return trendingMoviesList;
  }

  @override
  Future<List<MovieEntity>> fetchPopularMovies() async {
    const popularMoviesEndPoint = '/movie/popular';
    Map<String, dynamic> data =
        await apiService.get(endPoint: popularMoviesEndPoint);
    List<MovieEntity> popularMoviesList = getMoviesList(data);
    return popularMoviesList;
  }

  @override
  Future<List<MovieEntity>> fetchTopRatedMovies() async {
    const topRatedMoviesEndPoint = '/movie/top_rated';
    Map<String, dynamic> data =
        await apiService.get(endPoint: topRatedMoviesEndPoint);
    List<MovieEntity> topRatedMoviesList = getMoviesList(data);
    return topRatedMoviesList;
  }
}
