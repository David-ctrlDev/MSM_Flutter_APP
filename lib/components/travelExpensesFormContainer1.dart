
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
  bool visibility = false;
    
  Widget build(BuildContext context) {
        
    return(Column(
    
      children: [
      
      Container(
        height: 400,
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
      Row(
                    children:
                    [
                    Text("Fechas Inicio/Fin del viaje",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)]),
                    Row(children: [ ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: (){
                      setState(() {
                        visibility = !visibility;
                        print(visibility);
                      });
                    }, child: Text("Abrir Calendario"))],),
                    Visibility(
                      visible: visibility,
                      child: Card(
                      elevation: 5,
                      child: SfDateRangePicker(
                        showActionButtons: true,
                        onSubmit: (_date) {
                          setState(() {
                        visibility = !visibility;
                        print(visibility);
                      });
                          String parsedate= _date.toString();
                          parsedate.split(",");
                          print(parsedate);},
                        headerStyle: DateRangePickerHeaderStyle(textStyle: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,)),
                        headerHeight: 60,
                        enablePastDates: false,
                        showNavigationArrow: true,
                        controller: _controller,
                        initialSelectedDate: DateTime.now(),
                        onSelectionChanged:selectionChanged ,
                        selectionMode: DateRangePickerSelectionMode.range,
                        selectionTextStyle: TextStyle(color: Colors.white),
                        rangeSelectionColor: Colors.orange,
                        rangeTextStyle: TextStyle(color: Colors.white),
                        startRangeSelectionColor: Colors.orange,
                        
                        ),)
                    
        )],),
                    )
     
]));}


 void selectionChanged(DateRangePickerSelectionChangedArgs args) {
  SchedulerBinding.instance!.addPostFrameCallback((duration) {
    setState(() {
      
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

