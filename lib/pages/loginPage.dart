
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:msm_mobile_app/pages/homePage.dart';
import 'package:msm_mobile_app/utilities/constants.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:msm_mobile_app/utilities/fetch.dart';




class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var password = TextEditingController();
  var user = TextEditingController();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return (Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          title: Text(
            "MSM SUITE",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: size.width/30),
          ),
        ),
        body: SingleChildScrollView(
            child: Wrap(children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: size.height / 10,
              color: kPrimaryColor,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: size.width,
            child: Center(child: LoginColumn(user: user, password: password)),
          ),
          ClipPath(
              clipper: WaveClipperTwo(reverse: true),
              child: Container(
                height: size.height / 4.5,
                color: kPrimaryColor,
                child: SizedBox(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      child: Center(
                          child: Text(
                        "Dejando una linda huella en cada una de nuestras acciones",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width/25,
                        ),
                        textAlign: TextAlign.center,
                      ))),
                ),
              )),
        ]))));
  }
}

class LoginColumn extends StatelessWidget {
  const LoginColumn({
    Key? key,
    required this.user,
    required this.password,
  }) : super(key: key);

  final TextEditingController user;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/1.68,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width/2,
              child: Center(
                  child: Image.asset(
                'assets/images/loginImage2.png',
                height: MediaQuery.of(context).size.height/3,
              ))),
          SizedBox(
              width: MediaQuery.of(context).size.width/1.6,
              child: TextFormField(
                controller: user,
                style: TextStyle(fontSize:MediaQuery.of(context).size.width/30 ),
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: 'Porfavor ingresa tú usuario',
                    labelText: 'Usuario *',
                    labelStyle: TextStyle(color: kPrimaryColor)),
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width/1.6,
              child: TextFormField(
                style: TextStyle(fontSize:MediaQuery.of(context).size.width/30 ),
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: 'Porfavor ingresa tú contraseña',
                    labelText: 'Contraseña *',
                    labelStyle: TextStyle(color: kPrimaryColor)),
              )),
          SizedBox(
              width: 200,
              child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.white,
                    onPressed: () async {
                      await EasyLoading.show(status: "Cargando");
                      var data = await loginFetchData(password.text, user.text);
                      EasyLoading.dismiss(animation: false);
                      if (data == null) {
                        EasyLoading.dismiss();
                        showModalBottomSheet(
                            enableDrag: true,
                            elevation: 10.0,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  height: 150,
                                  color: Colors.white10,
                                  child: Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                        const Text(
                                          '¿No puedes ingresar?',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          'Comunicate con el Centro de Servicios.',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Image.asset(
                                            'assets/images/loginImage1.png',
                                            width: 100)
                                      ])));
                            });
                      }
    
                      if (data != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                data: data,
                              ),
                            ));
                      }
                    },
                    label: Text(
                      "Ingresar",
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize:MediaQuery.of(context).size.width/30 ),
                    ),
                    icon: Icon(
                      Icons.login_rounded,
                      color: kPrimaryColor,
                    ),
                    elevation: 20,
                  )))
        ],
      ),
    );
  }
}

