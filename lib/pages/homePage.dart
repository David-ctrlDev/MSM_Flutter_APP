import 'package:carousel_slider/carousel_slider.dart';
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
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          width: MediaQuery.of(context).size.width * 1,
          height: size.height * 0.2 - 30,
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
                    "Saludos ${data!.nombres?.split(" ")[0]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.height /40,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  Column(
                    
                    children:[ Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                     color: Colors.white, ),
                      
                      child: ClipRRect(child: Image.asset('assets/images/companiesLogos/${data!.empresa}.png',width: 65 ))),
                 ])
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
            padding: EdgeInsets.fromLTRB(5, 8, 5, 5),
            height: size.height/4.6,
            width: size.width,
            
            child:ComplicatedImageDemo(),
            ),
        Row(children: [
          Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 0)),
          Text(
            "Servicios",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica'),
          )]
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          height: size.height/2,
          width: size.width/1,
          child: ListviewHome(data,
        ),
        
      )]),
      
    ));
  }
}
class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            viewportFraction: 0.6,
          ),
          items: imageSliders,
       );}
}


final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item['image'], fit: BoxFit.cover, width: 1000.0,),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                        child: Text(
                          item['text'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

    final List<dynamic> imgList = [
  {'image':'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80','text':"Gestionamos tus eventos de formación"},
  {'image':'https://images.unsplash.com/photo-1523580846011-d3a5bc25702b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80','text':"Crece profesional mente, solicita tú auxilio educativo! "},
  {'image':'https://images.unsplash.com/photo-1530521954074-e64f6810b32d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80','text':"Legaliza ágilmente los gastos de tú viaje"},
  {'image':'https://images.unsplash.com/photo-1483097365279-e8acd3bf9f18?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1111&q=80','text':"Materializa tus sueños, pide tú crédito"},
  {'image':'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80','text':"Tramita tus incapacidades"},
];