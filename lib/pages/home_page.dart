import 'package:flutter/material.dart';

import 'package:movies/widgets/swiper_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        body: Column(children: [
          SwiperCard(
            movies: [1, 2, 3, 5],
          ),
        ]),
      ),
    );
  }
}
