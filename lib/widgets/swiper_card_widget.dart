import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class SwiperCard extends StatelessWidget {
  final List<dynamic>? movies;

  const SwiperCard({Key? key, required this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    if (movies!.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: heightScreen * 0.4,
        child: Swiper(
            layout: SwiperLayout.STACK,
            itemWidth: 250.0,
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
      return const CircularProgressIndicator();
    }
  }
}
