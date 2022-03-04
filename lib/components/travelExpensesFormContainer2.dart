import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:msm_mobile_app/components/travelExpensesFormContainer1.dart';
import 'package:msm_mobile_app/utilities/constants.dart';
import 'package:msm_mobile_app/utilities/fetch.dart';
import 'package:select_form_field/select_form_field.dart';



class FormContainer2 extends StatefulWidget {

 
  _FormContainer2 createState() => _FormContainer2();
  
}

List<DataColumn> dataTableColumns = [
  DataColumn(
          numeric: true,
          label: Text(
            'ID',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
  DataColumn(
    
          label: Text(
            'País',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Ciudad',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
];
List dataTableRows = [];
var selectedDestinations =[];
dynamic  listCities= [
  {
    'value': 'corporativo',
    'label': 'Para cargar las cuentas, recuerda Seleccionar Viaje Asociado a:',
    'icon': Icon(Icons.warning_rounded)
  },  
  ];  
class _FormContainer2 extends State<FormContainer2> {
  var destinationListAdd = [];
  TextEditingController? _controller;
  TextEditingController? _controlle2;
  var listCountrys;
  var dateDestinitaionIni;
  var dateDestinitaionEnd;
   var _valueChangedCity   = "";
  var _valueChangedCountry = "";
  var selectDate1TextDestination = "Fecha Inicio";
  var selectDate2TextDestination = "Fecha Fin";
  var distInpu       = TextEditingController();
  var costCenter     = TextEditingController();
  var mangmentCenter = TextEditingController();
  var internalOrder  = TextEditingController();
  var pospre         = TextEditingController();
  var graph          = TextEditingController();
  var operation      = TextEditingController();
  var pepElement     = TextEditingController();
  var fund           = TextEditingController();
  bool selectedIndex = false;
  int tableID = 0;



 


  Widget build(BuildContext context) {
    return (Container(
      width:MediaQuery.of(context).size.width ,
      child: Column(
        children: [
          ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size.fromWidth(220))),
        onPressed: (){_showMyDialogMain (context);},
        child: Text("Agregar Destino",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )),
        myDatatable(),
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
         SingleChildScrollView(
           child: StaggeredGrid.count(
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
               controller: distInpu,
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
           
           ],),
         )),
   actions: <Widget>[
          TextButton(
            child: const Text('Agregar'),
            onPressed: () {
              addDestinationListAdd(_valueChangedCountry,
                                    _valueChangedCity,
                                    dateDestinitaionIni,
                                    dateDestinitaionEnd,
                                    distInpu,
                                    costCenter,
                                    mangmentCenter,
                                    internalOrder,
                                    pospre,
                                    graph,
                                    operation,
                                    pepElement,
                                    fund);
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
                controller: _controlle2,
                initialValue: "" ,
                icon: Icon(Icons.public),
                labelText: 'Seleccione Ciudad',
                changeIcon: true,
                dialogTitle: 'Ciudad',
                dialogCancelBtn: 'CANCEL',
                enableSearch: true,
                dialogSearchHint: 'Buscar Ciudad',
                items: listCities,
                onChanged: (val)=>{_valueChangedCity = val, },
                
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
      listCities = list;
       EasyLoading.dismiss(animation: false);
    });
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


DataTable myDatatable(){

return(
  DataTable(
    dividerThickness: 2,
    headingTextStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
    showBottomBorder: true,
    checkboxHorizontalMargin: 10,
    showCheckboxColumn: true,
    headingRowColor:MaterialStateProperty.all(kPrimaryColor),
    columnSpacing: 45,
    columns: dataTableColumns,
    rows: getRows(dataTableRows),
    decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),), 
  ));
}

List<DataRow> getRows(List dataTableRows)=>dataTableRows.map((item)=>DataRow(
  selected: selectedDestinations.contains(item),
  onSelectChanged: (isSelected)=>setState((){
    final isAdding = isSelected !=null && isSelected;
    isAdding? selectedDestinations.add(item): selectedDestinations.remove(item);

  }),
  cells: [
  DataCell(Text(item['id'])),
  DataCell(Text(item['country'])),
  DataCell(Text(item['city'])),
])).toList();

void addDestinationListAdd(
  _valueChangedCountry,
_valueChangedCity,
dateDestinitaionIni,
dateDestinitaionEnd,
distInpu,
costCenter,
mangmentCenter,
internalOrder,
pospre,
graph,
operation,
pepElement,
fund){
  tableID = tableID+1;
  dataTableRows.add({
    "id"     : tableID.toString(),
    "country": _valueChangedCountry,
    "city"   : _valueChangedCity,
  });
  
   destinationListAdd.add(
    {
      "id"                  : tableID.toString(),
      "country"             : _valueChangedCountry,
      "city"                : _valueChangedCity,
      "dateDestinitaionIni" : selectDate1TextDestination,
      "dateDestinitaionEnd" : selectDate2TextDestination,
      "distInpu"            : distInpu.text,
      "cosCenter"           : costCenter.text,
      "managmentCenter"     : mangmentCenter.text,
      "internalOrder"       : internalOrder.text,
      "pospre"              : pospre.text,
      "graph"               : graph.text,
      "operation"           : operation.text,
      "pepElement"          : pepElement.text,
      "fund"                : fund.text
    }
  );


distInpu.clear();
costCenter.clear();
mangmentCenter.clear();
internalOrder.clear();
pospre.clear();
graph.clear();
operation.clear();
pepElement.clear();
fund.clear();
setState(() {
     EasyLoading.show(status: "Cargando");
      dataTableRows = dataTableRows;
      selectDate1TextDestination = "Fecha Inicio";
      selectDate2TextDestination = "Fecha Fin";
      _valueChangedCity   = "";
      _valueChangedCountry = "";
       EasyLoading.dismiss(animation: false);
    });
}
}

