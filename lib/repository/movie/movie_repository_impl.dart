import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tmdb/data/remote/dio_client.dart';
import 'package:tmdb/data/remote/tmdb_dio_exception.dart';
import 'package:tmdb/model/tmdb_movie_model.dart';
import 'package:tmdb/repository/movie/movie_repository.dart';

final movieListRepository = Provider<MovieRepository>((ref) {
  return MovieRepositoryImpl();
});

class MovieRepositoryImpl implements MovieRepository {
  final dio = DioClient();
  @override
  Future<List<MovieResult>> getUserList() async {
    try {
      final response = await dio.get('/discover/movie');
      final userList = (response["results"] as List)
          .map((e) => MovieResult.fromJson(e))
          .toList();
      return userList;
    } on DioException catch (e) {
      var error = TmdbDioException.fromDioError(e);
      throw error.errorMessage;
    }
  }
}
