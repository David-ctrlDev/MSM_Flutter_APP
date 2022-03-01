import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:msm_mobile_app/components/travelExpensesFormContainer1.dart';
import 'package:msm_mobile_app/utilities/constants.dart';
import 'package:msm_mobile_app/utilities/fetch.dart';
import 'package:select_form_field/select_form_field.dart';


class FormContainer2 extends StatefulWidget {

 
  _FormContainer2 createState() => _FormContainer2();

  
}

class _FormContainer2 extends State<FormContainer2> {

  TextEditingController? _controller;
  String _valueChanged = '';
 
  var listCountrys;
 


  Widget build(BuildContext context) {
    return (Container(
      child: Column(
        children: [
          Image.asset('assets/images/worldImage.png',width: 60,),
          ElevatedButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(Size.fromWidth(220))),
        onPressed: (){_showMyDialog (context);},
        child: Text("Agregar Destino",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
      Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(12),
        child: Container
        (
          alignment: Alignment.center,
          width: 262,
          child: DataTable(
            headingRowColor:
            MaterialStateColor.resolveWith((states) => kPrimaryColor),
            decoration: BoxDecoration(
                
                border: Border.all(
                color: kPrimaryColor,
                width: 3,
                      
            ),
            borderRadius: BorderRadius.circular(12),),
            showCheckboxColumn: true,
            showBottomBorder: true,
            columnSpacing: 10,
            columns: getDatacolumn(),
          
            rows: getDatarow(),
          ),
        ),
      )
        ],),
    ));
  }
  
  

List dataColumn = ["Destino","Fecha Inicio", "Fecha Fin"];
List dataRow =[];


List<DataColumn> getDatacolumn(){
  List<DataColumn> newDataColumn =[];
  for( var i in dataColumn){
    newDataColumn.add(DataColumn(label:Text(i)));

  }
  return newDataColumn;
}
List<DataRow> getDatarow(){
  List<DataRow> newDataRow=[];
  
  for (var i in dataRow){
    List<DataCell>newDataCell=[];
    for(var j in i){
      newDataCell.add(DataCell(Center(child: Text(j),)));
      print(newDataCell);
    }
    newDataRow.add(DataRow(cells: newDataCell));

  }
  return newDataRow;
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
                onChanged: (val) => setState(() => _valueChanged = val),
                
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
}