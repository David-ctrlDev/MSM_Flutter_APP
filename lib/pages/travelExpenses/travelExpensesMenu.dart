import 'package:flutter/material.dart';
import 'package:msm_mobile_app/components/draggableActionButton.dart';
import 'package:msm_mobile_app/components/toastCustom.dart';
import 'package:msm_mobile_app/models/login_response.dart';
import 'package:msm_mobile_app/pages/travelExpenses/legalizationsForm.dart';
import 'package:msm_mobile_app/pages/travelExpenses/travelExpensesForm.dart';
import 'package:msm_mobile_app/utilities/constants.dart';

class TravelExpensesMenu extends StatelessWidget {
  final User? data;
  TravelExpensesMenu(this.data);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (Scaffold(
        appBar: AppBar(
          title: Text("Suite MSM"),
          elevation: 0,
          backgroundColor: kPrimaryColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: DraggableButton(),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        body: Wrap(children: [
          ClipPath(
            clipper: SimpleClipper(),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              width: MediaQuery.of(context).size.width * 1,
              height: size.height * 0.3 - 28,
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Saludos ${data!.nombres?.split(" ")[0]}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Spacer(),
                      Column(children: [
                        Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                                child: Image.asset(
                                    'assets/images/companiesLogos/${data!.empresa}.png',
                                    width: 65))),
                      ])
                    ],
                  ),
                  Text(
                    "${(data!.cargo)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/viaticosListheader.png', width: 100),
                Text(
                  "Viáticos",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'helvetica'),
                )
              ],
            ),
          ])),
          Container(
            height: 400,
            child: travelExpensesView(context, data),
          )
        ])));
  }
}

class SimpleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    // path start with (0.0, 0.0) point
    path.lineTo(0.0, size.height - 100);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

ListView travelExpensesView(context, data) {
  return (ListView(
    children: [
      InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TravelExpensesForm(data),
                ));
            showToast(context);
          },
          child: Container(
              height: 100,
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Card(
                  elevation: 5,
                  child: Center(
                      child: ListTile(
                    leading: Image.asset(
                      'assets/images/viaticosAnticipoIcon.png',
                      width: 120,
                    ),
                    title: Text(
                      "Registrar Anticipo",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ))))),
      InkWell(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LegalizationsForm(),
                ),
              ),
          child: Container(
              height: 100,
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Card(
                  elevation: 5,
                  child: Center(
                      child: ListTile(
                    leading: Image.asset(
                      'assets/images/viaticosLegalizacionIcon.png',
                      width: 120,
                    ),
                    title: Text(
                      "Registrar Legalizacion",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ))))),
      InkWell(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LegalizationsForm(),
                ),
              ),
          child: InkWell(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TravelExpensesForm(data),
                    ),
                  ),
              child: Container(
                  height: 100,
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Card(
                      elevation: 5,
                      child: Center(
                          child: ListTile(
                        leading: Image.asset(
                          'assets/images/viaticosList.png',
                          width: 120,
                        ),
                        title: Text(
                          "Mis Solicitudes",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )))))),
    ],
  ));
}
