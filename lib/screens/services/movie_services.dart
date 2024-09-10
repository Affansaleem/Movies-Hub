import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieServices {

  // Popular movies
  Future<List<dynamic>> popularMovies() async {
    final header = {
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyN2Q2ZjNjODI5MGM4ZTA2NTZlNTM5NzdlNmFjYmNiZSIsIm5iZiI6MTcyNTg5ODg3Ni40OTQ0NTIsInN1YiI6IjY2ZGYxZmQ2ZmE5YzBmOGVhZDlkZmYyMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oPcznPmcUEbDo2s2oj-iGn2OkGY4IwQYwZbDZ0awjrE",
      'accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'),
        headers: header);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception('Error');
    }
  }

  // upcoming movies
  Future<List<dynamic>> upcomingMovies() async {
    final header = {
      'Authorization':
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyN2Q2ZjNjODI5MGM4ZTA2NTZlNTM5NzdlNmFjYmNiZSIsIm5iZiI6MTcyNTg5ODg3Ni40OTQ0NTIsInN1YiI6IjY2ZGYxZmQ2ZmE5YzBmOGVhZDlkZmYyMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oPcznPmcUEbDo2s2oj-iGn2OkGY4IwQYwZbDZ0awjrE",
      'accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1'),
        headers: header);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception('Error');
    }
  }

  //Top-rated movies
  Future<List<dynamic>> topRatedMovies() async {
    final header = {
      'Authorization':
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyN2Q2ZjNjODI5MGM4ZTA2NTZlNTM5NzdlNmFjYmNiZSIsIm5iZiI6MTcyNTg5ODg3Ni40OTQ0NTIsInN1YiI6IjY2ZGYxZmQ2ZmE5YzBmOGVhZDlkZmYyMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oPcznPmcUEbDo2s2oj-iGn2OkGY4IwQYwZbDZ0awjrE",
      'accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'),
        headers: header);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception('Error');
    }
  }

  // Similar movies
  Future<List<dynamic>> similarMovies(int movieId) async {
    final header = {
      'Authorization':
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyN2Q2ZjNjODI5MGM4ZTA2NTZlNTM5NzdlNmFjYmNiZSIsIm5iZiI6MTcyNTg5ODg3Ni40OTQ0NTIsInN1YiI6IjY2ZGYxZmQ2ZmE5YzBmOGVhZDlkZmYyMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oPcznPmcUEbDo2s2oj-iGn2OkGY4IwQYwZbDZ0awjrE",
      'accept': 'application/json'
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$movieId/similar?language=en-US&page=1'),
        headers: header);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['results'];
    } else {
      throw Exception('Error');
    }
  }
}
