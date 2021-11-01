import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class SwiperCard extends StatelessWidget {
  final List<dynamic>? movies;

  const SwiperCard({Key? key, required this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    if (movies!.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: heightScreen * 0.4,
        child: Swiper(
            layout: SwiperLayout.STACK,
            itemWidth: 200.0,
            itemCount: movies!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return FadeInImage(
                placeholder: const AssetImage('assets/placeholder.png'),
                image: NetworkImage(movies![index].getPosterImg()),
                fit: BoxFit.fitHeight,
              );
            }),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
