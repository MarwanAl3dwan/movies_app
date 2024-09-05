import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/functions.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/entities/person_entity.dart';

abstract class SearchRemoteDataSource {
  Future<List<MovieEntity>> fetchMovieSearch(String query);
  Future<List<PersonEntity>> fetchPersonSearch(String query);
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> fetchMovieSearch(String query) async {
    const searchEndPoint = '/search/movie';
    Map<String, dynamic> data = await apiService
        .get(endPoint: searchEndPoint, extraParameters: {'query': query});
    List<MovieEntity> movies = getMoviesList(data);
    return movies;
  }

  @override
  Future<List<PersonEntity>> fetchPersonSearch(String query) async {
    const searchEndPoint = '/search/person';
    Map<String, dynamic> data = await apiService
        .get(endPoint: searchEndPoint, extraParameters: {'query': query});
    List<PersonEntity> people = getPersonsList(data);
    return people;
  }
}
