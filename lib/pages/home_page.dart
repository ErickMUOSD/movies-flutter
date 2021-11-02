import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/providers/movie_provider.dart';
import 'package:movies/search/search_delegate.dart';
import 'package:movies/widgets/movie_horizontal.dart';
import 'package:movies/widgets/swiper_card_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final moviesProvider = MoviesProvider();
  @override
  Widget build(BuildContext context) {
    moviesProvider.getPopular();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies '),
          backgroundColor: Colors.indigoAccent,
          actions: [
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: DataSearch(),
                  );
                })
          ],
        ),
        body: Column(children: <Widget>[swiperCard(), _footer(context)]),
      ),
    );
  }

  Widget swiperCard() {
    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>?> snapshot) {
        if (snapshot.hasData) {
          return SwiperCard(
            movies: snapshot.data!.cast<Movie>(),
          );
          // return Expanded(child: SwiperCasero(movies: snapshot.data));
        } else {
          return Container(
              height: 400,
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Expanded(
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Populares',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10.0,
          ),
          StreamBuilder(
            stream: moviesProvider.popularStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                return MoviesHorziontal(
                  movies: snapshot.data!.cast<Movie>(),
                  nextPage: moviesProvider.getPopular,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
