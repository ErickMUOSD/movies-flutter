import 'package:flutter/material.dart';

import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:movies/models/movie_model.dart';
import 'package:card_swiper/card_swiper.dart';

class SwiperCard extends StatelessWidget {
  final List<dynamic>? movies;

  SwiperCard({Key? key, required this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    if (movies!.isNotEmpty) {
      return Container(
        width: double.infinity,
        height: heightScreen * 0.4,
        child: Swiper(
            layout: SwiperLayout.STACK,
            itemWidth: 300.0,
            itemCount: movies!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/placeholder.png'),
                  image: NetworkImage(movies![index].getPosterImg()),
                  fit: BoxFit.contain,
                ),
              );
            }),
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}
