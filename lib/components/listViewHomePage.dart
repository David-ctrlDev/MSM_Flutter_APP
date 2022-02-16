import 'package:flutter/material.dart';
import 'package:msm_mobile_app/pages/travelExpenses/travelExpensesMenu.dart';


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
            elevation: 10,
            margin: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                ListTile(
                  onTap:()=> Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TravelExpensesMenu(),),),
                  title: Text(
                    "Viáticos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Container(
                      child: Column(children: [
                    Text(
                      "Bonificaciones y legalizaciones",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Image.asset(
                      'assets/images/viaticosImage.png',
                      width: 70,
                    ),
                  ])),
                )
              ],
            )),
        Card(
          
            elevation: 10,
            margin: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              
              children: [
                ListTile(
                  title: Text(
                    "Aprendizaje ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),
                  ),
                  subtitle: Container(
                      child: Column(children: [
                    Text(
                      "Eventos de Formación!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Image.asset(
                      'assets/images/learnImage.png',
                      width: 70,
                    ),
                  ])),
                )
              ],
            )),
        Card(
            elevation: 10,
            margin: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Préstamos",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Container(
                      child: Column(children: [
                    Text(
                      "Solicita tú crédito ahora!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Image.asset(
                      'assets/images/prestamos.png',
                      width: 70,
                    ),
                  ])),
                )
              ],
            )),
       Card(
            elevation: 10,
            margin: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Nómina",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Container(
                      child: Column(children: [
                    Text(
                      "incapacidades, traslados y más",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Image.asset(
                      'assets/images/nomina.png',
                      width: 70,
                    ),
                  ])),
                ),
          
              ],
            )),
      ]));
}
