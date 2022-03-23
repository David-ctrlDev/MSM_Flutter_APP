
import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:msm_mobile_app/components/travelExpensesFormContainer1.dart';
import 'package:msm_mobile_app/utilities/constants.dart';
import 'package:msm_mobile_app/utilities/fetch.dart';
import 'package:select_form_field/select_form_field.dart';



class FormContainer3 extends StatefulWidget {

 
  _FormContainer3 createState() => _FormContainer3();
  
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
            'Aeropuerto',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Icon(
           Icons.airplanemode_active,color:Colors.white,
          ),
        ),
];
var airPortsListAdd = [];
List dataTableRows = [];
var selectedAirport =[];

class _FormContainer3 extends State<FormContainer3>{
  
  var flyNumber =  TextEditingController();
  var aditionalInfo =  TextEditingController();
   var airPort =  TextEditingController();
  TextEditingController? _controller;
  var airPortsList;
  var _valueChangedAirport;
  bool selectedIndex = false;
  int tableID = 0;
  late Widget customField;

  
  Widget build(BuildContext context) {
    return (Container(
      width:MediaQuery.of(context).size.width ,
      child: Column(
        children: [
          ShakeAnimatedWidget(
              enabled: true,
              duration: Duration(milliseconds: 1000),
              shakeAngle: Rotation.deg(z: 1),
              curve: Curves.linear,
              child: Image.asset('assets/images/busImage.png', width: 100,),
      ),
    
          ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size.fromWidth(220))),
        onPressed: (){_showMyDialogMain (context);},
        child: Text("Agregar Desplazamiento",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          )),
        myDatatable2(),
     ])));
      
  }
  

Future<void> _showMyDialogMain(context) async {

   Future<List> _futureOfList = airPortFetchData(destinationValue);
    await EasyLoading.show(status: "Cargando");
    List list = await _futureOfList;
    setState(() {
      airPortsList = list;
      if (destinationValue == 'nacional'){
        customField = SelectFormField(
                textCapitalization:TextCapitalization.none,
                type: SelectFormFieldType.dialog,
                controller: _controller,
                icon: Icon(Icons.airplanemode_active_rounded),
                labelText: 'Seleccione el Aeropuerto',
                changeIcon: true,
                dialogTitle: 'Aeropuerto',
                dialogCancelBtn: 'CANCEL',
                enableSearch: true,
                dialogSearchHint: 'Buscar',
                items: airPortsList,
                onChanged: (val) =>
                      {_valueChangedAirport = val},
                                         
              );}
      else {
        customField = TextField(
            controller:  airPort,
            decoration: InputDecoration(
                icon: Icon(Icons.bookmark_added_sharp),
                hintText: 'Aeropuerto',
                hintStyle:
                    TextStyle(fontSize: 16,)));
           }       
    });
    EasyLoading.dismiss(animation: false);
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context,) {
      return AlertDialog(
        backgroundColor: Colors.white,
         insetPadding: EdgeInsets.all(10),
         contentPadding: EdgeInsets.all(10),
        title: const Text('Desplazamientos Aeroportuarios',style: TextStyle(fontWeight: FontWeight.bold),),
        content: Container(
          height: MediaQuery.of(context).size.height/3,
          width: MediaQuery.of(context).size.width/2 ,
          child:
         SingleChildScrollView(
           child:Column(
            children: <Widget>[
          customField,
          Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: TextField(
            controller: flyNumber ,
            decoration: InputDecoration(
                icon: Icon(Icons.bookmark_added_sharp),
                hintText: 'Número del vuelo',
                hintStyle:
                    TextStyle(fontSize: 16,)),
          )),
          Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: TextField(
            minLines: 6,
            controller: aditionalInfo ,
            maxLines: null,
            decoration: InputDecoration(
                icon: Icon(Icons.bookmark_added_sharp),
                hintText: 'Información Adicional',
                
                hintStyle:
                    TextStyle(fontSize: 16,)),
          ))
            ])
          
         )),
   actions: <Widget>[
     TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              setState(() {
                airPort.clear();
                flyNumber.clear();
                aditionalInfo.clear();
              });
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Agregar'),
            onPressed: () {
              if (destinationValue == 'internacional'){
                _valueChangedAirport = airPort.text;
              
              addDestinationListAdd(_valueChangedAirport);


              }
              
            else{
              addDestinationListAdd(_valueChangedAirport);
            }
              Navigator.of(context).pop();
            },
          ),
        ],);
   
  });
}


DataTable myDatatable2(){

return(
  DataTable(
    dividerThickness: 2,
    headingTextStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
    showBottomBorder: true,
    checkboxHorizontalMargin: 10,
    showCheckboxColumn: true,
    headingRowColor:MaterialStateProperty.all(kPrimaryColor),
    columnSpacing: 15,
    columns: dataTableColumns,
    rows: getRows(dataTableRows),
    decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),), 
  ));
}

List<DataRow> getRows(List dataTableRows)=>dataTableRows.map((item)=>DataRow(
  selected: selectedAirport.contains(item),
  onSelectChanged: (isSelected)=>setState((){
    final isAdding = isSelected !=null && isSelected;
    isAdding? selectedAirport.add(item): selectedAirport.remove(item);

  }),
  cells: [
  DataCell(Text(item['id'])),
  DataCell(Text(item['airport'])),
  DataCell((item['icon'])),
])).toList();

void addDestinationListAdd(
  _valueChangedAirport, 
){

  tableID = tableID+1;
  dataTableRows.add({
    "id"     : tableID.toString(),
    "airport": _valueChangedAirport,
    "icon"   : Icon(Icons.airplanemode_active) 
  });
  
   airPortsListAdd.add(
    {
      "id"                  : tableID.toString(),
      "airport"             : _valueChangedAirport,
      "flyNumber"           : flyNumber.text,
      "aditionalInfo"       : aditionalInfo.text
    }
  );
setState(() {
     EasyLoading.show(status: "Cargando");
      dataTableRows = dataTableRows;
          airPort.clear();
                flyNumber.clear();
                aditionalInfo.clear();
       EasyLoading.dismiss(animation: false);
       
    });
}

}
