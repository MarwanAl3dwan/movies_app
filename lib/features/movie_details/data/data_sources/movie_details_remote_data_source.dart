import '../../../../core/utils/api_service.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../models/movie_details_model/movie_details_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieEntity> fetchMovieDetails(int movieId);
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

  MovieEntity _getMovieEntity(Map<String, dynamic> data) {
    MovieEntity movie;
    movie = MovieDetailsModel.fromJson(data);
    return movie;
  }
}
