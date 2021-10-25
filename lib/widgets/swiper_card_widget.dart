import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class SwiperCard extends StatelessWidget {
  final List<dynamic> movies;

  const SwiperCard({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        padding: const EdgeInsets.only(top: 10.0),
        width: widthScreen * 0.8,
        height: heightScreen * 0.45,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://via.placeholder.com/150',
                fit: BoxFit.cover,
              ),
            );
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: 3,
          viewportFraction: 0.8,
          scale: 0.9,
          pagination: SwiperPagination(),
          control: SwiperControl(),
        ),
      ),
    );
  }
}
