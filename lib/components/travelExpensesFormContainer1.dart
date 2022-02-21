
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
//import 'package:intl/intl.dart';

class FormContainer1 extends StatefulWidget{
 

  _FormContainer1 createState() => _FormContainer1();
  

} 
var value;
var dateValueIni;
var dateValueEnd;
class _FormContainer1 extends State<FormContainer1>{
  
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
        
    return(Column(
    
      children: [
      
      Container(
        height: 200,
        child: ListView(
          children: [
            Text("Destino del viaje",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
      Card(
        margin:EdgeInsets.fromLTRB(10, 10, 10,20),
        elevation: 5,
        child:SelectFormField(
        style:TextStyle(fontWeight: FontWeight.bold) ,
        initialValue: 'nacional',
        icon: Icon(Icons.public),
        labelText: 'Destino',
        items: _items,
        onChanged: (val ) => {
          value = val
        },
        //onSaved: (val) => print(val),
      )),    
      ElevatedButton(
          onPressed: () => _selectDate(context),
          child: Text('Seleccione Fecha Inicio'),
          ),
      ElevatedButton(
          onPressed: () => _selectDate2(context),
          child: Text('Seleccione Fecha Fin'),
          ),
          

          
        ]
      )
    )
  ]));
                    
  }


 

final List<Map<String, dynamic>> _items = [
  {
    'value': 'nacional',
    'label': 'Nacional',
    'icon': Icon(Icons.bus_alert)
  },
  {
    'value': 'internacional',
    'label': 'Internacional',
    'icon': Icon(Icons.airplanemode_on_sharp),
    'textStyle': TextStyle(color: Colors.red),
  },

];}

