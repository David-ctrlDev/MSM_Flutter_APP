import 'package:flutter/material.dart';
import 'package:msm_mobile_app/components/listViewHomePage.dart';
import 'package:msm_mobile_app/models/login_response.dart';
import 'package:msm_mobile_app/utilities/constants.dart';

class HomePage extends StatelessWidget {
  final User? data;
  HomePage({
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? capitalize(String s) =>
        s[0].toUpperCase() + s.substring(1).toLowerCase();
    return (Scaffold(
      appBar: AppBar(
        title: Text("Suite MSM"),
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          width: MediaQuery.of(context).size.width * 1,
          height: size.height * 0.2 - 47,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Saludos ${capitalize(data!.nombres!)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  Icon(
                    Icons.coronavirus_sharp,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
              Text(
                "${capitalize(data!.cargo)}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
        Row(children: [
          Padding(padding: EdgeInsets.fromLTRB(20, 40, 20, 0)),
          Text(
            "Servicios",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica'),
          )
        ]),
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          height: 500,
          width: 400,
          child: ListviewHome(),
        )
      ]),
    ));
  }
}
