import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';

class MoviesHorziontal extends StatelessWidget {
  final List<dynamic>? movies;
  final Function? nextPage;
  MoviesHorziontal({Key? key, required this.movies, required this.nextPage})
      : super(key: key);
  final PageController _pageController =
      PageController(initialPage: 5, viewportFraction: 0.4);
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        nextPage!();
      }
    });

    return Container(
      height: _screenSize.height * 0.3,
      child: PageView.builder(
        pageSnapping: false,
        padEnds: false,
        controller: _pageController,
        itemCount: movies!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _cards(movies![index]),
      ),
    );
  }

  Widget _cards(Movie movies) {
    return Container(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: FadeInImage(
          placeholder: const AssetImage('assets/placeholder.png'),
          image: NetworkImage(movies.getPosterImg()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
