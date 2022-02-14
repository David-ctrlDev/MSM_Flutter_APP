import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:msm_mobile_app/pages/homePage.dart';
//import 'package:msm_mobile_app/models/login_response.dart';
import 'package:msm_mobile_app/utilities/fetch.dart';

class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var password = TextEditingController();
  var user = TextEditingController();
  

  Widget build(BuildContext context) {
    return (Scaffold(
      
        appBar: AppBar(
          centerTitle: true,
          title: Text("MSM_SUITE"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: Center(
                      child: Image.asset(
                'assets/images/mvtellogo.png',
                height: 150,
              ))),
              SizedBox(
                  width: 500,
                  child: Center(
                      child: Image.asset(
                    'assets/images/loginImage2.png',
                    height: 200,
                  ))),
              SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: user,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Please, enter your username',
                      labelText: 'User *',
                    ),
                  )),
              SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Please, enter your password',
                      labelText: 'Password *',
                    ),
                  )),
              SizedBox(
                width: 300,
                child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: FloatingActionButton.extended(
                        onPressed: () async{
                          await EasyLoading.show(status:"Login");
                          var data = await loginFetchData(password.text, user.text);
                          EasyLoading.dismiss(animation: false);
                         if (data == null){
                           EasyLoading.dismiss();
                           showModalBottomSheet(
                           context: context,
                           builder:(BuildContext context){
                            return Container(
                                            height: 200,
                                            color: Colors.amber,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  const Text('Modal BottomSheet')
                                                ]
                                              )
                                            )
                            );            
                         }
                           );
                        }
                        
                         if (data != null ){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(data:data ,),));
                         }
                        
                       //loginFetchData(password.text, user.text);
                       //print(loginFetchData);
                      }, label: Text("Login"),
                        icon: Icon(Icons.login_rounded),
                        
              )
                ))],
          ),
          
        ),)
        );
  }
}
