import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msm_mobile_app/utilities/fetch.dart';
import 'package:select_form_field/select_form_field.dart';

class FormContainer1 extends StatefulWidget {
  _FormContainer1 createState() => _FormContainer1();
}

var value;
var dateValueIni;
var dateValueEnd;
var _items3;

class _FormContainer1 extends State<FormContainer1> {
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        dateValueIni = currentDate;
        print(dateValueIni);
      });
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        dateValueEnd = currentDate;
        print(dateValueEnd);
      });
  }

  Widget build(BuildContext context) {
    return (SingleChildScrollView(
        child: Column(children: [
      Container(
          height: 380,
          child: ListView(children: [
            Card(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                elevation: 4,
                child: Column(children: [
                  SelectFormField(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    initialValue: 'nacional',
                    icon: Icon(Icons.public),
                    labelText: 'Destino',
                    items: _items,
                    onChanged: (val) => {value = val},
                    toolbarOptions: ToolbarOptions(copy: true),
                    //onSaved: (val) => print(val),
                  ),
                  SelectFormField(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    initialValue: 'negocio',
                    icon: Icon(Icons.public),
                    labelText: 'Viaje asociado a:',
                    items: _items2,
                    onChanged: (val) => {value = val, func()},
                  ),
                  SelectFormField(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    initialValue: 'negocio',
                    icon: Icon(Icons.public),
                    labelText: 'Viaje asociado a:',
                    items: _items3,
                    onChanged: (val) => {value = val},
                  )
                ])),
            Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.bookmark_added_sharp),
                      hintText: 'Objeto del viaje',
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.settings_applications_outlined),
                      hintText: 'Número de viaje SAP',
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                )),
            ElevatedButton(
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size.fromWidth(10))),
              onPressed: () => _selectDate(context),
              child: Text(
                'Seleccione Fecha Inicio',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            ElevatedButton(
              onPressed: () => func(), //_selectDate2(context),
              child: Text(
                'Seleccione Fecha Fin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ]))
    ])));
  }

  final List<Map<String, dynamic>> _items2 = [
    {
      'value': 'corporativo',
      'label': 'Corporativo',
      'icon': Icon(Icons.bus_alert)
    },
    {
      'value': 'negocio',
      'label': 'Negocio',
      'icon': Icon(Icons.airplanemode_on_sharp),
      'textStyle': TextStyle(color: Colors.red),
    },
  ];

  final List<Map<String, dynamic>> _items = [
    {'value': 'nacional', 'label': 'Nacional', 'icon': Icon(Icons.bus_alert)},
    {
      'value': 'internacional',
      'label': 'Internacional',
      'icon': Icon(Icons.airplanemode_on_sharp),
      'textStyle': TextStyle(color: Colors.red),
    },
  ];
  void func() async {
    Future<List> _futureOfList = viajeAsociadoFetchData();
    List list = await _futureOfList;
    setState(() {
      _items3 = list;
    });
  }
}
