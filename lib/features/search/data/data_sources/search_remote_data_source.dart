import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/functions.dart';
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
    List<MovieEntity> movies = getMoviesList(data);

    return movies;
  }
}
