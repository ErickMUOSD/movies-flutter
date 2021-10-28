import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/providers/movie_provider.dart';

import 'package:movies/widgets/swiper_card_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final moviesProvider = MoviesProvider();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies '),
          backgroundColor: Colors.indigoAccent,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Column(children: <Widget>[
          swiperCard(),
        ]),
      ),
    );
  }

  Widget swiperCard() {
    return FutureBuilder(
      future: moviesProvider.getNowPlaying(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return SwiperCard(
            movies: snapshot.data!,
          );
        } else {
          return Container(
              height: 400,
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
