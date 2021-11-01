import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[_appBar(movie)],
      ),
    );
  }

  Widget _appBar(Movie? movie) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      elevation: 2.0,
      expandedHeight: 200.0,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie!.title.toString(),
          style: const TextStyle(fontSize: 16.0),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/placeholder.png'),
          image: NetworkImage(movie.getBackgroundImg()),
          fadeInDuration: const Duration(microseconds: 100),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
