import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Please, enter your username',
                      labelText: 'User *',
                    ),
                  )),
              SizedBox(
                  width: 300,
                  child: TextFormField(
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
                        onPressed: () {
                          print("hello");
                        },
                        icon: Icon(Icons.login_rounded),
                        label: Text("Login"))),
              )
            ],
          ),
        )));
  }
}
