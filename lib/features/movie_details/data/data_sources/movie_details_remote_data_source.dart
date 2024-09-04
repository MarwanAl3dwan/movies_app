import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/functions.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/entities/cast_member_entity.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<List<MovieEntity>> fetchSimilarMovies(int movieId);
  Future<List<CastMemberEntity>> fetchCastMembers(int movieId);
}

class MovieDetailsRemoteDataSourceImpl extends MovieDetailsRemoteDataSource {
  final ApiService apiService;

  MovieDetailsRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<MovieEntity>> fetchSimilarMovies(int movieId) async {
    final movieDetailsEndPoint = '/movie/$movieId/similar';
    Map<String, dynamic> data =
        await apiService.get(endPoint: movieDetailsEndPoint);
    List<MovieEntity> movies = getMoviesList(data);
    return movies;
  }

  @override
  Future<List<CastMemberEntity>> fetchCastMembers(int movieId) async {
    final creditsEndPoint = '/movie/$movieId/credits';
    Map<String, dynamic> data = await apiService.get(endPoint: creditsEndPoint);
    List<CastMemberEntity> castMembers = getMembersList(data);
    return castMembers;
  }
}
