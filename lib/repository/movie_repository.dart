import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_movie_tmdb/models/movie.dart';

class MovieRepository {
  List<Movie> movie;
  Future loadMovies(int page) async {
    String _page = page.toString();
    var queryPram = {
      'api_key': '2665d2776a3a52a505d0ea4584a81f23',
      'language': 'ko',
      'page': _page,
    };
    var uri = Uri.https("api.themoviedb.org", "/3/movie/popular", queryPram);
    var response = await http.get(uri);
    if (response.body != null) {
      Map<String, dynamic> body = jsonDecode(response.body);
      if (body['results'] != null) {
        List<dynamic> result = body['results'];
        return result.map<Movie>((item) => Movie.fromJson(item)).toList();
      } else print('result is null');
    } else print('data load fail');
  }

}