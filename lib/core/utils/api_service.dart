import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://api.themoviedb.org/3/trending/movie';
  final String apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOTQ0ZWFjNjRhYzgwMGMxOWY1OTBjMmZlNDYwMWVlMCIsIm5iZiI6MTcyNDYwODMyMC4zMzU2OSwic3ViIjoiNjZjYjZlNmJkN2JjNWJiNjMxNDhiMzYxIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.NeMzyGsiFF77iUrbC_qqauprvCFz5yt43avGwFONq_c';

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl/$endPoint');
    return response.data;
  }
}
