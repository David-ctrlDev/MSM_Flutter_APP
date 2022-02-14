import 'package:flutter/material.dart';
import 'package:msm_mobile_app/models/login_response.dart';

class HomePage extends StatelessWidget {
  final User? data;
  HomePage({this.data,});
  
 
  @override
  Widget build(BuildContext context) {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1).toLowerCase();
    
    return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: SizedBox(child: Text('Bienvenido ${capitalize(data!.nombres!)} al MSM'))
          
        ),
        body: ListView(
          children: <Widget>[
           miCardImage()
          ],
        ));
  }

  Card miCardImage() {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(15),
      elevation: 10,

      // Dentro de esta propiedad usamos ClipRRect
      child: ClipRRect(

        // Los bordes del contenido del card se cortan usando BorderRadius
        borderRadius: BorderRadius.circular(30),

        // EL widget hijo que será recortado segun la propiedad anterior
        child: Column(
          children: <Widget>[

            // Usamos el widget Image para mostrar una imagen
            Image(

              // Como queremos traer una imagen desde un url usamos NetworkImage
              image: NetworkImage(
                  'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
            ),

            // Usamos Container para el contenedor de la descripción
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Montañas'),
            ),
          ],
        ),
      ));
}}