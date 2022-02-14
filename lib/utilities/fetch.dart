import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:msm_mobile_app/models/login_response.dart';

Future <User>loginFetchData(password, user) async {
  const url= 'https://www.mv-tel.com/MSM_Viaticos_API_TEST/api/Usuarios/LoginUserPassword';
  
  final response = await http.post(Uri.parse(url),
  headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  body:jsonEncode(<String, String>{
    'username': user,
    'password': password
  }));
 
 final  body = jsonDecode(response.body);
 final responseData = User.fromJson(body);
 

  return responseData;
}
