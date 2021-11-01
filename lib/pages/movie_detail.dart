import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _appBar(movie),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10,
            ),
            _titleMovie(movie, context),
            _description(movie),
          ]))
        ],
      ),
    );
  }

  Widget _appBar(Movie? movie) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      elevation: 2.0,
      expandedHeight: 150.0,
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
          fadeInDuration: const Duration(milliseconds: 150),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _titleMovie(Movie? movie, BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: NetworkImage(movie!.getPosterImg()),
              height: 120,
            ),
          ),
        ),
        Flexible(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.title.toString(),
                style: Theme.of(context).textTheme.subtitle2),
            Text(movie.originalTitle.toString()),
            Row(
              children: [
                Icon(
                  Icons.star_border,
                  color: movie.getColorVoteCount(),
                ),
                Text(movie.voteAverage.toString())
              ],
            )
          ],
        ))
      ],
    );
  }

  _description(Movie? movie) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        movie!.overview.toString(),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
