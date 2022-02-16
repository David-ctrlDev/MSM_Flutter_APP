import 'package:flutter/material.dart';

class ListviewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (myGridView(context));
  }
}

GridView myGridView(context) {
  return (GridView(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      // Generate 100 widgets that display their index in the List.
      children: [
        Card(
            child: ListTile(
          title: Text("Viáticos"),
        )),
        Card(
            child: ListTile(
          title: Text("Viáticos"),
        )),
        Card(
            child: ListTile(
          title: Text("Viáticos"),
        )),
        Card(
            child: ListTile(
          title: Text("Viáticos"),
        ))
      ]));
}
