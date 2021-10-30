import 'dart:math';

import 'package:flutter/material.dart';

class SwiperCasero extends StatefulWidget {
  final List<dynamic>? movies;
  const SwiperCasero({Key? key, @required this.movies}) : super(key: key);

  @override
  _SwiperCaseroState createState() => _SwiperCaseroState();
}

class _SwiperCaseroState extends State<SwiperCasero> {
  PageController? pageController;
  double viewPortFraction = 0.8;
  double? pageOffSet = 0;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewPortFraction)
          ..addListener(() {
            setState(() {
              pageOffSet = pageController!.page;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: widget.movies!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          double scale = max(viewPortFraction,
              (1 - (pageOffSet! - index).abs()) + viewPortFraction);
          double angle = (pageOffSet! - index).abs();

          if (angle > 0.5) {
            angle = 1 - angle;
          }
          return Container(
            padding: EdgeInsets.only(
              right: 10,
              left: 5,
              top: 50 - scale * 25,
              bottom: 30,
            ),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(
                  3,
                  2,
                  0.001,
                )
                ..rotateY(angle),
              alignment: Alignment.center,
              child: FadeInImage(
                width: MediaQuery.of(context).size.width,
                placeholder: const AssetImage('assets/placeholder.png'),
                image: NetworkImage(widget.movies![index].getPosterImg()),
                fit: BoxFit.fill,
                alignment: Alignment((pageOffSet! - index).abs() * 0.5, 0),
              ),
            ),
          );
        });
  }
}
