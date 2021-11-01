import 'package:flutter/material.dart';
import 'package:movies/models/actors_model.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/providers/movie_provider.dart';

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
            _actors(movie!.id.toString()),
          ]))
        ],
      ),
    );
  }

  Widget _appBar(Movie? movie) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      elevation: 2.0,
      expandedHeight: 130.0,
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
          child: Hero(
            tag: movie!.id.toString(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(movie.getPosterImg()),
                height: 120,
              ),
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

  Widget _description(Movie? movie) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        movie!.overview.toString(),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _actors(String id) {
    final moviesProvider = MoviesProvider();
    return FutureBuilder(
      future: moviesProvider.getCast(id),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return ActorCard(snapshot.data!.cast<Actor>());
          // return Expanded(child: SwiperCasero(movies: snapshot.data));
        } else {
          return Container(
              height: 400,
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget ActorCard(List<Actor> actors) {
    return Container(
      height: 150,
      child: Column(
        children: [
          const Text(
            'Cast',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              itemCount: actors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/placeholder.png'),
                      image: NetworkImage(actors[index].getPosterImg()),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
