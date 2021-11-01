import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // builder de las sugerencias
    return Container();
  }
}
