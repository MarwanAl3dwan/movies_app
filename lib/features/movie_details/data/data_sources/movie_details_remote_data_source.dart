import '../../../../core/utils/api_service.dart';
import '../../../home/data/models/movie_model.dart';
import '../../../home/domain/entities/movie_entity.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<List<MovieEntity>> fetchSimilarMovies(int movieId);
}

class MovieDetailsRemoteDataSourceImpl extends MovieDetailsRemoteDataSource {
  final ApiService apiService;

  MovieDetailsRemoteDataSourceImpl({required this.apiService});


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
}
