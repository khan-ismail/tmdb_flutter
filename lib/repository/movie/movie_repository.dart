import 'package:tmdb/model/tmdb_movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieResult>> getUserList();
  // Future<NewUser> addNewUser(String name, String job);
  // Future<NewUser> updateUser(String id, String name, String job);
  // Future<void> deleteUser(String id);
}
