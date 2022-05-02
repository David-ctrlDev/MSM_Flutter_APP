
import 'package:flutter/material.dart';
import 'dart:math' as math;
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
        
          label: Icon(
           Icons.flag_rounded,color:Colors.white,
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
        DataColumn(
        
          label: Icon(
           Icons.delete,color:Colors.white,
          ),
        ),
];
var destinationListAdd = [];
List dataTableRows = [];
var selectedDestinations =[];
dynamic  listCities= [
  {
    'value': 'corporativo',
    'label': 'Para cargar las cuentas, recuerda Seleccionar Viaje Asociado a:',
    'icon': Icon(Icons.warning_rounded)
  },  
  ];  
class _FormContainer2 extends State<FormContainer2> with SingleTickerProviderStateMixin{
 
  late final AnimationController _controllerAnimation = AnimationController(vsync: this, duration: Duration(seconds: 7),)..repeat();
 
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
  bool visibility = false;






  Widget build(BuildContext context) {
    return (
      
      Container(
      width:MediaQuery.of(context).size.width ,
      child: Column(
        children: [AnimatedBuilder(
          animation: _controllerAnimation,
          builder: (_, child) {
            return Transform.rotate(
              angle: _controllerAnimation.value * 2 * math.pi,
              child: Image.asset('assets/images/worldImage.png', width: 100,),
            );
          },),
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
  final _formKey = GlobalKey<FormState>();
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
         Form(
           key: _formKey,
           child: SingleChildScrollView(
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
                 validator: (value) {
                    if (value!.isEmpty) {
                    return 'Escribe la distribución';
                  }
                    return null;
                },
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
                 validator: (value) {
                    if (value!.isEmpty) {
                    return 'Escribe el centro de costos';
                  }
                    return null;
                },
                controller: costCenter,
                            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                labelText: 'Centro de Costos',
                icon: Icon(Icons.text_rotation_none_rounded,),
                                                 
             ))),
             StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
               child:TextFormField(
                 validator: (value) {
                    if (value!.isEmpty) {
                    return 'Ingresa el centro gestor';
                  }
                    return null;
                },
                controller: mangmentCenter,
                            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                labelText: 'Centro Gestor',
                icon: Icon(Icons.text_rotation_none_rounded,),
                                                 
             ))),
             StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
               child:TextFormField(
                 validator: (value) {
                    if (value!.isEmpty) {
                    return 'Ingresa la orden interna';
                  }
                    return null;
                },
                controller: internalOrder,
                            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                labelText: 'Orden Interna',
                icon: Icon(Icons.text_rotation_none_rounded,),
                                                 
             ))),
             StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
               child:TextFormField(
                 validator: (value) {
                    if (value!.isEmpty) {
                    return 'Ingresa el Pospre';
                  }
                    return null;
                },
                controller: pospre,
                            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                labelText: 'Pospre',
                icon: Icon(Icons.text_rotation_none_rounded,),
                                                 
             ))),
             StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
               child:TextFormField(
                 validator: (value) {
                    if (value!.isEmpty) {
                    return 'Ingresa el grafo';
                  }
                    return null;
                },
                controller: graph,
                            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                labelText: 'Grafo',
                icon: Icon(Icons.text_rotation_none_rounded,),
                                                 
             ))),
             StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
               child:TextFormField(
                 validator: (value) {
                    if (value!.isEmpty) {
                    return 'Ingresa la operación';
                  }
                    return null;
                },
                controller: operation,
                            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                labelText: 'Operación',
                icon: Icon(Icons.text_rotation_none_rounded,),
                                                 
             ))),
             StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
               child:TextFormField(
                 validator: (value) {
                    if (value!.isEmpty) {
                    return 'Ingresa el PeP';
                  }
                    return null;
                },
                controller: pepElement,
                            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                labelText: 'Elemento PeP',
                icon: Icon(Icons.text_rotation_none_rounded,),
                                                 
             ))),
             StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
               child:TextFormField(
                 validator: (value) {
                    if (value!.isEmpty) {
                    return 'Ingresa el fondo';
                  }
                    return null;
                },
                controller: fund,
                            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                labelText: 'Fondo',
                icon: Icon(Icons.text_rotation_none_rounded,),
                                                 
             ))),
             
             ],),
           ),
         )),
   actions: <Widget>[
     TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Agregar'),
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                    return;
                  }
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
    border: TableBorder.all(
            width: 1.0,
            color: kPrimaryColor.withAlpha(70),
            borderRadius: BorderRadius.circular(10),
            ),
    dividerThickness: 2,
    headingTextStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
    showBottomBorder: true,
    checkboxHorizontalMargin: 10,
    showCheckboxColumn: false,
    headingRowColor:MaterialStateProperty.all(kPrimaryColor),
    columnSpacing: 15,
    columns: dataTableColumns,
    rows: getRows(dataTableRows),
    decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),),
    
  
  ));
}

List<DataRow> getRows(List dataTableRows)=>dataTableRows.map((item)=>DataRow(
  selected: selectedDestinations.contains(item),
  onSelectChanged: (isSelected)=>setState((){
          
          visibility = !visibility;
          
       
    final isAdding = isSelected !=null && isSelected;
    isAdding? selectedDestinations.add(item): selectedDestinations.remove(item);
        for (var i in selectedDestinations){
                 
                  destinationListAdd.removeWhere(
                    (item) => item['id'] == i['id']);
                  selectedDestinations.remove(i);
                  dataTableRows.remove(i);
        
                  setState(() {
                    destinationListAdd = destinationListAdd;
                    dataTableRows = dataTableRows;
                    selectedDestinations = selectedDestinations;
                    visibility = !visibility;
                  });
        
                
                }

  }),
  cells: [
  
  DataCell((item['flag']),
  onTap:() => null),
  DataCell(Text(item['country']),
  onTap:() => null),
  DataCell(Text(item['city']),
  onTap:() => null),
  DataCell(Icon(Icons.delete)),
 
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
    "flag"   : Image.asset('assets/images/flags/$_valueChangedCountry.png',width: 32,) 
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

