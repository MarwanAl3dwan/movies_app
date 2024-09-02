import '../../../../core/utils/api_service.dart';
import '../../../home/data/models/movie_model.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../models/movie_details_model/movie_details_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieEntity> fetchMovieDetails(int movieId);
  Future<List<MovieEntity>> fetchSimilarMovies(int movieId);
}

class MovieDetailsRemoteDataSourceImpl extends MovieDetailsRemoteDataSource {
  final ApiService apiService;

  MovieDetailsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<MovieEntity> fetchMovieDetails(int movieId) async {
    final movieDetailsEndPoint = '/movie/$movieId';
    Map<String, dynamic> data =
        await apiService.get(endPoint: movieDetailsEndPoint);
    MovieEntity movie = _getMovieEntity(data);
    return movie;
  }

  @override
  Future<List<MovieEntity>> fetchSimilarMovies(int movieId) async {
    final movieDetailsEndPoint = '/movie/$movieId/similar';
    Map<String, dynamic> data =
        await apiService.get(endPoint: movieDetailsEndPoint);
    List<MovieEntity> movies = _getMoviesList(data);
    return movies;
  }

  List<MovieEntity> _getMoviesList(Map<String, dynamic> data) {
    List<MovieEntity> movies = [];
    for (var movie in data['results']) {
      movies.add(MovieModel.fromJson(movie));
    }
    return movies;
  }

  MovieEntity _getMovieEntity(Map<String, dynamic> data) {
    MovieEntity movie;
    movie = MovieDetailsModel.fromJson(data);
    return movie;
  }
}
