import 'package:flutter/material.dart';

class MoviesHorziontal extends StatelessWidget {
  final List<dynamic>? movies;
  final Function? nextPage;
  MoviesHorziontal({Key? key, required this.movies, required this.nextPage})
      : super(key: key);
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 0.3);
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        print('load movies');
        nextPage!();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
          pageSnapping: false,
          controller: _pageController,
          itemCount: movies!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: FadeInImage(
                placeholder: const AssetImage('assets/placeholder.png'),
                image: NetworkImage(movies![index].getPosterImg()),
                fit: BoxFit.contain,
              ),
            );
          }),
    );
  }

  // List<Widget> _cards() {
  //   return movies!.map((movie) {
  //     return Container(
  //       margin: EdgeInsets.only(right: 15.0),
  //       child: Column(
  //         children: [
  //           FadeInImage(
  //             placeholder: const AssetImage('assets/placeholder.png'),
  //             image: NetworkImage(movies!.getPosterImg()),
  //             fit: BoxFit.cover,
  //             height: 140.0,
  //           ),
  //         ],
  //       ),
  //     );
  //   }).toList();
  // }
}
