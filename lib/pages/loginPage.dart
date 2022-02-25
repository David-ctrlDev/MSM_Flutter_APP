import 'package:flutter/cupertino.dart';
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
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            child: Wrap(children: [
          SizedBox(
            height: 10.0,
          ),
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: size.height / 6,
              color: kPrimaryColor,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 500,
            child: Center(child: LoginColumn(user: user, password: password)),
          ),
          ClipPath(
              clipper: WaveClipperTwo(reverse: true),
              child: Container(
                height: size.height / 6,
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
                          fontSize: 20,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: 200,
            child: Center(
                child: Image.asset(
              'assets/images/loginImage2.png',
              height: 250,
            ))),
        SizedBox(
            width: 250,
            child: TextFormField(
              controller: user,
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
            width: 250,
            child: TextFormField(
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
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    Icons.login_rounded,
                    color: kPrimaryColor,
                  ),
                  elevation: 20,
                )))
      ],
    );
  }
}

class GreenClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 50);

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 20);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(
        size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
