import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: Text(movie!.title.toString()),
    );
  }
}
