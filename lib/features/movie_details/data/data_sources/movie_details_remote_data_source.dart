import '../../../../core/utils/api_service.dart';
import '../../../home/data/models/movie_model.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/entities/cast_member_entity.dart';
import '../models/cast_member_model.dart';

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
    List<MovieEntity> movies = _getMoviesList(data);
    return movies;
  }

  @override
  Future<List<CastMemberEntity>> fetchCastMembers(int movieId) async {
    final creditsEndPoint = '/movie/$movieId/credits';
    Map<String, dynamic> data = await apiService.get(endPoint: creditsEndPoint);
    List<CastMemberEntity> castMembers = _getMembersList(data);
    return castMembers;
  }

  List<CastMemberEntity> _getMembersList(Map<String, dynamic> data) {
    List<CastMemberEntity> castMembers = [];
    for (var member in data['cast']) {
      castMembers.add(CastMemberModel.fromJson(member));
    }
    return castMembers;
  }

  List<MovieEntity> _getMoviesList(Map<String, dynamic> data) {
    List<MovieEntity> movies = [];
    for (var movie in data['results']) {
      movies.add(MovieModel.fromJson(movie));
    }
    return movies;
  }
}
