import 'package:flutter/material.dart';
import 'package:msm_mobile_app/models/login_response.dart';

class TravelExpensesForm extends StatelessWidget {
  final User? data;
  TravelExpensesForm(this.data);

  @override
  Widget build(BuildContext context) {
    return(Scaffold(appBar:AppBar(title:Text("Viaticos Form")

    )));}}