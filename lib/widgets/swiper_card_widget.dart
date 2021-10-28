import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:movies/models/movie_model.dart';

class SwiperCard extends StatefulWidget {
  final List<dynamic>? movies;

  const SwiperCard({Key? key, required this.movies}) : super(key: key);

  @override
  State<SwiperCard> createState() => _SwiperCardState();
}

class _SwiperCardState extends State<SwiperCard> {
  ScrollController listController = ScrollController();

  @override
  void initState() {
    super.initState();
    listController.addListener(() {
      setState(() {
        // print(listController.offset);
      });

    });

  }
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: double.infinity,
        height: heightScreen * 0.4,
        padding: const EdgeInsets.only(top: 10.0),
        // child: Swiper(
        //   layout: SwiperLayout.STACK,
        //   itemWidth: widthScreen * 0.6,
        //   itemHeight: heightScreen * 0.4,
        //   itemCount: movies!.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ClipRRect(
        //       borderRadius: BorderRadius.circular(10.0),
        //       child: FadeInImage(
        //         placeholder: const AssetImage('assets/placeholder.png'),
        //         image: NetworkImage(movies![index].getPosterImg()),
        //         fit: BoxFit.cover,
        //       ),
        //     );
        //   },
        // ),
        child: ListView.builder(
          itemCount: widget.movies!.length,
          scrollDirection: Axis.horizontal,
          controller: listController ,
          itemBuilder: (context, index) {
            return Align(
              widthFactor: 0.7,
              alignment: Alignment.topCenter,
              child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: FadeInImage(

                          placeholder: const AssetImage('assets/placeholder.png'),
                          image: NetworkImage(widget.movies![index].getPosterImg()),
                          fit: BoxFit.cover,
                        ),
                      ),
            );
          },
        ),
      ),
    );
  }
}
