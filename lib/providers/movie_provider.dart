import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies/models/movie_model.dart';

class MoviesProvider {
  final String _apiKey = '475101f9539bd8382a797e10bafa9205';
  final String _url = 'api.themoviedb.org';
  final String _languaje = 'es-ES';

  Future<List<MovieModel>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'languaje': _languaje,
    });
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final movies = Movies.fromJsonList(decodedData['results']);

    return movies.items!;
  }
}
