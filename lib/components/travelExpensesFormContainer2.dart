import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:msm_mobile_app/components/travelExpensesFormContainer1.dart';
import 'package:msm_mobile_app/utilities/fetch.dart';
import 'package:select_form_field/select_form_field.dart';


class FormContainer2 extends StatefulWidget {

 
  _FormContainer2 createState() => _FormContainer2();
  
}
dynamic _valueChangedCity = [
  {
    'value': 'corporativo',
    'label': 'Para cargar las cuentas, recuerda Seleccionar Viaje Asociado a:',
    'icon': Icon(Icons.warning_rounded)
  },  
  ];  
class _FormContainer2 extends State<FormContainer2> {

  TextEditingController? _controller;
  String _valueChangedCountry = '';
  var listCountrys;
  var dateDestinitaionIni;
  var dateDestinitaionEnd;
  var selectDate1TextDestination = "Fecha Inicio";
  var selectDate2TextDestination = "Fecha Fin";
 


  Widget build(BuildContext context) {
    return (Container(
      child: Column(
        children: [
          ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size.fromWidth(220))),
        onPressed: (){_showMyDialogMain (context);},
        child: Text("Agregar Destino",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )),
     ])));
      
  }
  

Future<void> _showMyDialogMain(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context,) {
      return AlertDialog(
        title: const Text('Destinos',style: TextStyle(fontWeight: FontWeight.bold),),
        content: Container(
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width ,
          child:
         GridView(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1/1.2),
          children: <Widget>[
        Card(
          child: Container(
            height: 250,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1585871746932-e133d3fedf4d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=770&q=80"),
            fit: BoxFit.fitHeight,
            alignment: Alignment.topCenter,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            ListTile(
              title: Text("País", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
             children: [
               ElevatedButton(
                 child: const Text('Buscar'),
                 onPressed: () {_showMyDialog(context);},
               )]),
          ],),)),
      Card(
          child: Container(
            height: 250,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1568668392383-58c369615742?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=719&q=80"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            ListTile(
              title: Text("Ciudad", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
             children: [
               ElevatedButton(
                 child: const Text('Buscar'),
                 onPressed: () {_showMyDialog2(context);},
               )]),
          ],),)),
         Card(
           child: ElevatedButton(
                 style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size.fromWidth(220))),
                 onPressed: () => _selectDate(context),
                 child: Text(
            selectDate1TextDestination,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                 ),
               ),
         ),
      Card(
        child: ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size.fromWidth(220))),
          onPressed: () => _selectDate2(context),
          child: Text(
            selectDate2TextDestination,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        
        ),
      )]
      
  )),
   actions: <Widget>[
          TextButton(
            child: const Text('Agregar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],);
   
  });
}

Future<void> _showMyDialog(context) async {

    Future<List> _futureOfList = destinationFetchData(destinationValue);
    await EasyLoading.show(status: "Cargando");
    List list = await _futureOfList;
    setState(() {
      
      listCountrys = list;
       
    });
    EasyLoading.dismiss(animation: false);

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context,) {
      return AlertDialog(
        title: const Text('Destinos',style: TextStyle(fontWeight: FontWeight.bold),),
        content: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              SelectFormField(
                textCapitalization:TextCapitalization.none,
                type: SelectFormFieldType.dialog,
                controller: _controller,
                //initialValue: _initialValue,
                icon: Icon(Icons.public),
                labelText: 'Seleccione el país',
                changeIcon: true,
                dialogTitle: 'País',
                dialogCancelBtn: 'CANCEL',
                enableSearch: true,
                dialogSearchHint: 'Buscar país',
                items: listCountrys,
                onChanged: (val) =>
                      {_valueChangedCountry = val, func(_valueChangedCountry)},
                                         
              ),
            ])),
        actions: <Widget>[
          TextButton(
            child: const Text('Agregar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _showMyDialog2(context) async {

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context,) {
      return AlertDialog(
        title: const Text('Destinos',style: TextStyle(fontWeight: FontWeight.bold),),
        content: SingleChildScrollView(
          child:Column(
            children: <Widget>[
               SelectFormField(
                textCapitalization:TextCapitalization.none,
                type: SelectFormFieldType.dialog,
                controller: _controller,
                initialValue: _valueChangedCountry,
                icon: Icon(Icons.public),
                labelText: 'Seleccione Ciudad',
                changeIcon: true,
                dialogTitle: 'País',
                dialogCancelBtn: 'CANCEL',
                enableSearch: true,
                dialogSearchHint: 'Buscar país',
                items: _valueChangedCity,
                onChanged: (val){ print(val);},
                
              ),
            ])),
        actions: <Widget>[
          TextButton(
            child: const Text('Agregar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  

void func(destination) async {
  
    Future<List> _futureOfList = destinationCityFetchData(destination);
    await EasyLoading.show(status: "Cargando");
    List list = await _futureOfList;
    setState(() {
      _valueChangedCity = list;
       EasyLoading.dismiss(animation: false);
    });
    print(_valueChangedCity);
  }
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
        dateDestinitaionIni = currentDate;
        selectDate1TextDestination = DateFormat.yMMMMd().format(dateDestinitaionIni).toString();
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
        dateDestinitaionEnd = currentDate;
        selectDate2TextDestination = DateFormat.yMMMMd().format(dateDestinitaionEnd).toString();
      });
  }

}

