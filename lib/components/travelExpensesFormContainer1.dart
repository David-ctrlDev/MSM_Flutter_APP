
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//import 'package:intl/intl.dart';

class FormContainer1 extends StatefulWidget{
 

  _FormContainer1 createState() => _FormContainer1();
  

} 
var value;
var datevalue;
class _FormContainer1 extends State<FormContainer1>{
  
 
 
  final DateRangePickerController _controller = DateRangePickerController();
  dynamic _date = "";
  
  
  


  
  Widget build(BuildContext context) {
    
    return(ListView(
      shrinkWrap: true,
      children: [
      Text("Destino del viaje",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
      Card(
        margin:EdgeInsets.fromLTRB(10, 10, 10,20),
        elevation: 20,
        child:SelectFormField(
        scrollPadding:EdgeInsets.fromLTRB(10, 10, 10,20),
        initialValue: 'nacional',
        icon: Icon(Icons.public),
        labelText: 'Destino',
        items: _items,
        onChanged: (val ) => {
          value = val
        },
        //onSaved: (val) => print(val),
      )),
      
      Container(
        child: Column(
          children: [Row(
                    
                    children:
                    [Text("Fechas Inicio/Fin del viaje",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)]),
                    Card(
                      elevation: 20,
                      child: SfDateRangePicker(
                        
                        controller: _controller,
                        initialSelectedDate: DateTime.now(),
                        onSelectionChanged:selectionChanged ,
                        selectionMode: DateRangePickerSelectionMode.multiple,
                        ),
        )],),
                    )
     
]));}
 void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  SchedulerBinding.instance!.addPostFrameCallback((duration) {
    setState(() {
      print(args.value);
      _date= args.value;
      datevalue = _date;
      
   
    });
    
  });
  
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