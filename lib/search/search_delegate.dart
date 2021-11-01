import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String _selection = '';
  final peliculas = ['BEe', 'jeilo verde', 'Suicide squad', 'im a legend'];
  final populars = ['Spider', 'Avengers'];
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
    return Center(
        child: Container(
      height: 100,
      width: 100,
      color: Colors.amber,
      child: Text(_selection),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaSug = (query.isEmpty)
        ? peliculas
        : peliculas
            .where((element) => element.toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
      itemCount: listaSug.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          leading: const Icon(Icons.movie),
          title: Text(listaSug[index]),
          onTap: () {
            _selection = listaSug[index];
          },
        );
      },
    );
  }
}
