import 'package:flutter/material.dart';
import 'package:msm_mobile_app/components/draggableActionButton.dart';
import 'package:msm_mobile_app/components/listViewHomePage.dart';
import 'package:msm_mobile_app/models/login_response.dart';
import 'package:msm_mobile_app/utilities/constants.dart';

class HomePage extends StatelessWidget {
  final User? data;
  HomePage({
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return (Scaffold(
      appBar: AppBar(
        title: Text("Suite MSM"),
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: DraggableButton(),
      floatingActionButtonAnimator:FloatingActionButtonAnimator.scaling ,
      body: Wrap(children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          width: MediaQuery.of(context).size.width * 1,
          height: size.height * 0.2 - 47,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Saludos ${(data!.nombres!)}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  Icon(
                    Icons.coronavirus_sharp,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
              Text(
                "${(data!.cargo)}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        
        Container(
            padding: EdgeInsets.fromLTRB(10, 0, 30, 20),
            height: size.height/4.8,
            width: 400,
            
            child: ListView(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Icon(Icons.arrow_back_ios_rounded,color: Colors.grey,),
                Container(
                  
                  child:Card(
                    elevation: 3,
                    child:Column(children: [
                    Text('Planifica y proyecta!'),
                    Image.asset('assets/images/planificationListImage.png',width: 90,)
                  ],),),
                  width: 180.0,
                ),
                Container(
                 child:Card(
                    elevation: 3,
                    child:Column(children: [
                    Text('Mide y toma decisiones!'),
                    Image.asset('assets/images/metricsListImage .png',width: 90,)
                  ],),),
                  width: 180.0,
                ),
                Container(
                  child:Card(
                    elevation: 3,
                    child:Column(children: [
                    Text('Ahorra y crece!'),
                    Image.asset('assets/images/growListImage.png',width: 70,)
                  ],),),
                  width: 180.0,
                ),
                Container(
                  
                  child:Card(
                    elevation: 3,
                    child:Column(children: [
                    Text('Planifica y proyecta!'),
                    Image.asset('assets/images/planificationListImage.png',width: 90,)
                  ],),),
                  width: 180.0,
                  
                ),
                Container(
                  child:Card(
                    elevation: 3,
                    child:Column(children: [
                    Text('Planifica y proyecta!'),
                    Image.asset('assets/images/planificationListImage.png',width: 90,)
                  ],),),
                  width: 180.0,
                ),
                Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
              ],
            )),
            Row(children: [
          Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 0)),
          Text(
            "Servicios",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica'),
          )
        ]),
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          height: size.height/2,
          width: 400,
          child: ListviewHome(data,
        ),
        
      )]),
      
    ));
  }
}
