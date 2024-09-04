import '../../../../core/utils/api_service.dart';
import '../../../home/data/models/movie_model.dart';
import '../../../home/domain/entities/movie_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<MovieEntity>> fetchSearchedMovies(String query);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> fetchSearchedMovies(String query) async {
    const searchEndPoint = '/search/movie';
    Map<String, dynamic> data = await apiService
        .get(endPoint: searchEndPoint, extraParameters: {'query': query});
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
