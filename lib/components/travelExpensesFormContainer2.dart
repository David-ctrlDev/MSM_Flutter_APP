import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        backgroundColor: Colors.white,
         insetPadding: EdgeInsets.all(10),
         contentPadding: EdgeInsets.all(10),
        title: const Text('Destinos',style: TextStyle(fontWeight: FontWeight.bold),),
        content: Container(
          height: MediaQuery.of(context).size.height/1.35,
          width: MediaQuery.of(context).size.width ,
          child:
         StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
         
          children: <Widget>[
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20), ),
            child: Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
              image: NetworkImage("https://images.unsplash.com/photo-1585871746932-e133d3fedf4d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=770&q=80"),
              fit: BoxFit.cover,
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
        ),
        StaggeredGridTile.count(
             crossAxisCellCount: 2,
          mainAxisCellCount: 2,
        child: Card(
          
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20), ),
            child: Container(
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
      ),
       StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 0.5,
         child: ElevatedButton(
                       
                       onPressed: () => _selectDate(context),
                       child: Text(
                  selectDate1TextDestination,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                       ),
                     ),
       ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 0.5,
          child: ElevatedButton(
            
            onPressed: () => _selectDate2(context),
            child: Text(
              selectDate2TextDestination,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            )),
        ),
         StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
           child:TextFormField(
                        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            labelText: 'Dist Inpu',
            icon: Icon(Icons.text_rotation_none_rounded,),
                                             
         ))),
         StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
           child:TextFormField(
                        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            labelText: 'Centro de Costos',
            icon: Icon(Icons.text_rotation_none_rounded,),
                                             
         ))),
         StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
           child:TextFormField(
                        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            labelText: 'Centro Gestor',
            icon: Icon(Icons.text_rotation_none_rounded,),
                                             
         ))),
         StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
           child:TextFormField(
                        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            labelText: 'Orden Interna',
            icon: Icon(Icons.text_rotation_none_rounded,),
                                             
         ))),
         StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
           child:TextFormField(
                        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            labelText: 'Pospre',
            icon: Icon(Icons.text_rotation_none_rounded,),
                                             
         ))),
         StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
           child:TextFormField(
                        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            labelText: 'Grafo',
            icon: Icon(Icons.text_rotation_none_rounded,),
                                             
         ))),
         StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
           child:TextFormField(
                        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            labelText: 'Operación',
            icon: Icon(Icons.text_rotation_none_rounded,),
                                             
         ))),
         StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
           child:TextFormField(
                        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            labelText: 'Elemento PeP',
            icon: Icon(Icons.text_rotation_none_rounded,),
                                             
         ))),
         StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
           child:TextFormField(
                        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            labelText: 'Fondo',
            icon: Icon(Icons.text_rotation_none_rounded,),
                                             
         ))),
         
         ],)),
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

