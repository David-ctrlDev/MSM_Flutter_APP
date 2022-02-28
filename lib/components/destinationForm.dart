import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';

class DestinationContainer extends StatefulWidget {
   final listCountrys;
  DestinationContainer(this.listCountrys);


  _DestinationContainer createState() => _DestinationContainer(listCountrys);
}

var selectDate1Text = "Seleccione Fecha Inicio";
var selectDate2Text = "Seleccione Fecha Fin";
var associatedValue;
var accountValue;
var dateValueIni;
var dateValueEnd;
var travelObject;
var sapNumber;


class _DestinationContainer extends State<DestinationContainer> {
  final listCountrys;

  _DestinationContainer(this.listCountrys);
  
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
        selectDate1Text = DateFormat.yMMMMd().format(dateValueIni).toString();
        _items = listCountrys;
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
        selectDate2Text = DateFormat.yMMMMd().format(dateValueIni).toString();
      });
  }

  Widget build(BuildContext context) {
    return (SingleChildScrollView(
        child: Column(children: [
      Container(
          height: 180,
          child: Column(children: [
            Card(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                elevation: 4,
                child: SelectFormField(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  initialValue: '',
                  icon: Icon(Icons.public),
                  labelText: "Destino",
                  items: _items,
                  onChanged: (val) => { val, print(listCountrys)},

                  //onSaved: (val) => print(val),
                )),
            Card(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                elevation: 4,
                child: SelectFormField(
                  
                  scrollPadding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  initialValue: '',
                  icon: Icon(Icons.public),
                  labelText: 'Viaje asociado a:',
                  items: _items2,
                  onChanged: (val) =>{},
                )),
            Card(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                elevation: 4,
                child: SelectFormField(
                  hintText: "Recuerda Seleccionar el Viaje",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  icon: Icon(Icons.account_balance_wallet_sharp),
                  labelText: 'Cuenta Contable:',
                  items: listCountrys,
                  onChanged: (val) => {accountValue = val},
                ))
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.bookmark_added_sharp),
                hintText: 'Objeto del viaje',
                hintStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          )),
      Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.settings_applications_outlined),
                hintText: 'Número de viaje SAP',
                hintStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          )),
      ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size.fromWidth(220))),
        onPressed: () => _selectDate(context),
        child: Text(
          selectDate1Text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
      ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size.fromWidth(220))),
        onPressed: () => _selectDate2(context),
        child: Text(
          selectDate2Text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      )
    ])));
  }

   List<Map<String, dynamic>> _items2 = [
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

   List<Map<String, dynamic>> _items = [
    {'value': 'nacional', 'label': 'Nacional', 'icon': Icon(Icons.bus_alert)},
    {
      'value': 'internacional',
      'label': 'Internacional',
      'icon': Icon(Icons.airplanemode_on_sharp),
      'textStyle': TextStyle(color: Colors.red),
    },
  ];
  
}
