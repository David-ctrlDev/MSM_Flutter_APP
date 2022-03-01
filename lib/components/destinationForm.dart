import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DestinationContainer extends StatefulWidget {
  final listCountrys;

  DestinationContainer(this.listCountrys);


  _DestinationContainer createState() => _DestinationContainer(listCountrys);
}


class _DestinationContainer extends State<DestinationContainer> {
final listCountrys;
var itemsList;

  _DestinationContainer(this.listCountrys);
  
  

  
 
  Widget build(BuildContext context) {
      
    return (SingleChildScrollView(
      
        child:  TextButton(
          onPressed: () {
            setState(() {
              itemsList = listCountrys;

            });
            print(itemsList);
          },
           child: Text(itemsList.toString()))           ));}}
        