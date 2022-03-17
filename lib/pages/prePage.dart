import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:msm_mobile_app/pages/loginPage.dart';


class PrePage extends StatelessWidget {
  const PrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children:[
            Center(child:MyStatefulWidget() ),
                
            ]));
          
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000,),()
    {Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>Login(),));});
    return Container(
   
     width: MediaQuery.of(context).size.width,
     child: Column(
       children: [
         FadeIn(child: Image.asset('assets/images/mvtellogo.png',height:100,),
         duration: Duration(milliseconds: 600),
         curve: Curves.easeIn,),
         
       ],
     )
      
    );
  }
}
