import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';


showToast(context){
  return(
  MotionToast.info(
	title:  Text("Tener en Cuenta", style: TextStyle(fontWeight: FontWeight.bold),),
	description:  Text('''- La Información que registrara en el formato solo debe obedecer entre las fechas de inicio y fin del viaje. Esto incluye la información principal del formato, Destinos, Desplazamientos, Gastos adicionales y Facturas para deducibles.'''),


	width:  MediaQuery.of(context).size.width-20,
  height: MediaQuery.of(context).size.height/4,
  toastDuration: Duration(seconds: 10),

).show(context));
}
