import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

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
          _swipeCards(wScreen: widthScreen, hScreen: heightScreen)
        ]),
      ),
    );
  }

  Widget _swipeCards({double? wScreen, double? hScreen}) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      width: wScreen,
      height: hScreen! * 0.3,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            'https://via.placeholder.com/150',
            fit: BoxFit.fill,
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
    );
  }
}
