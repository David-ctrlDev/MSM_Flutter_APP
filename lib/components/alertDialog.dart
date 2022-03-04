import 'package:flutter/material.dart';

Future<void> alertDialog(context) async {

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context,) {
      return AlertDialog(
              title:Text("Cuidado!"),
              content: SingleChildScrollView(child:Text("Debes ingresar el destino")),  
        actions: <Widget>[
          TextButton(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}