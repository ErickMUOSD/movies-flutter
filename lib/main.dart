import 'package:flutter/material.dart';

import 'package:movies/pages/home_page.dart';
import 'package:movies/pages/movie_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        'detail': (context) => MovieDetail(),
      },
    );
  }
}
