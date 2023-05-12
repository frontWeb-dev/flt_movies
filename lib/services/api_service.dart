import 'dart:convert';

import 'package:flt_movies/models/movie_thumb_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String popular = 'popular';
  static const String playing = 'now-playing';
  static const String coming = 'coming-soon';

  Future<List<MovieThumbModel>> getPopularMovies() async {
    List<MovieThumbModel> popularMovies = [];

    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body).values.toList();
      final List<dynamic> movies = body[1];

      for (var movie in movies) {
        final instance = MovieThumbModel.fromJson(movie);
        popularMovies.add(instance);
      }

      return popularMovies;
    }

    throw Error();
  }

  Future<List<MovieThumbModel>> getNowPlayingMovies() async {
    List<MovieThumbModel> nowPlayingMovies = [];

    final url = Uri.parse('$baseUrl/$playing');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body).values.toList();
      final List<dynamic> movies = body[2];

      for (var movie in movies) {
        final instance = MovieThumbModel.fromJson(movie);
        nowPlayingMovies.add(instance);
      }

      return nowPlayingMovies;
    }

    throw Error();
  }

  Future<List<MovieThumbModel>> getComingMovies() async {
    List<MovieThumbModel> comingSoonMovies = [];

    final url = Uri.parse('$baseUrl/$coming');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body).values.toList();
      final List<dynamic> movies = body[2];

      for (var movie in movies) {
        final instance = MovieThumbModel.fromJson(movie);
        comingSoonMovies.add(instance);
      }

      return comingSoonMovies;
    }

    throw Error();
  }
}
