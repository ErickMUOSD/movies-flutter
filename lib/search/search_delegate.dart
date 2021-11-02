import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/providers/movie_provider.dart';

class DataSearch extends SearchDelegate {
  final moviesPRovider = MoviesProvider();
  @override
  List<Widget>? buildActions(BuildContext context) {
    // acciones de nuestro appBar
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.delete))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // iconos al inicio
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // builder los resultados
    // return Center(
    //     child: Container(
    //   height: 100,
    //   width: 100,
    //   color: Colors.amber,
    //   child: Text(_selection),
    // ));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    } else {
      return FutureBuilder(
        future: moviesPRovider.searchMovie(query),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>?> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.map((e) {
                return ListTile(
                  leading: FadeInImage(
                    placeholder: const AssetImage('assets/placeholder.png'),
                    image: NetworkImage(e.getPosterImg()),
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  subtitle: Text(e.title.toString()),
                  onTap: () {
                    close(context, null);
                    Navigator.pushNamed(context, 'detail', arguments: e);
                  },
                );
              }).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
    }
  }
}
