import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movies/models/movie_model.dart';

class MoviesProvider {
  final String _apiKey = '475101f9539bd8382a797e10bafa9205';
  final String _url = 'api.themoviedb.org';
  final String _languaje = 'es-ES';

  //streams
  int _popularesPage = 0;
  List<Movie>? _popularsList = [];

  final _popularsStream = StreamController<List<Movie>>.broadcast();

  Function(List<Movie>) get popularSink => _popularsStream.sink.add;
  Stream<List<Movie>> get popularStream => _popularsStream.stream;

  void disposeStreams() {
    _popularsStream.close();
  }

  Future<List<Movie>?> getResponse(Uri url) async {
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    final movies = Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future<List<Movie>?> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'languaje': _languaje,
    });
    return await getResponse(url);
  }

  Future<List<Movie>?> getPopular() async {
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'languaje': _languaje,
      'page': _popularesPage.toString()
    });
    final response = await getResponse(url);
    _popularsList!.addAll(response!);
    popularSink(_popularsList!);
    return response;
  }
}
