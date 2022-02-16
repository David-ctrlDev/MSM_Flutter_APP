import 'dart:io';

import 'package:flutter/material.dart';
import 'package:msm_mobile_app/pages/loginPage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MSM',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Login(),
      builder: EasyLoading.init(),
    );
  }
}
