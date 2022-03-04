import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:msm_mobile_app/models/cityDestinationResponse.dart';
import 'package:msm_mobile_app/models/destinationResponse.dart';
import 'package:msm_mobile_app/models/login_response.dart';
import 'package:msm_mobile_app/models/viajeAsociadoResponse.dart';

Future<User?> loginFetchData(password, user) async {
  const url =
      'https://www.mv-tel.com/MSM_Viaticos_API_TEST/api/Usuarios/LoginUserPassword';

  final response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{'username': user, 'password': password}));
  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    final responseData = User.fromJson(body);
    return responseData;
  } else {
    final responseData = null;
    return responseData;
  }
}

Future<List<Map<String, dynamic>>> viajeAsociadoFetchData(destination) async {
  var url =
      'https://www.mv-tel.com/MSM_Viaticos_API_Test/api/CuentaContable/ObtenerCuentasContablesPorViajeAsociado/$destination';

  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    final responseData = ViajeAsociadoList.fromJson(body);
    List<Map<String, dynamic>> myList = [];
    for (var i in responseData.viajes) {
      myList.add({'value': '${i.codigo}', 'label': '${i.codigo}'});
    }
    return myList;
  } else {
    final responseData = null;
    
    return responseData;
  }
}

Future<List<Map<String, dynamic>>> destinationFetchData(destination) async {
  destination == 'nacional'? destination = 'Nacional': destination=destination;
  var url =
      'https://www.mv-tel.com/MSM_Viaticos_API_Test/api/Pais/$destination';

  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    final responseData = DestinationList.fromJson(body);
    List<Map<String, dynamic>> myList = [];
    for (var i in responseData.destinations) {
      myList.add({'value': '${i.id}', 'label': '${i.nombre}'},);
    }
   
    return myList;
  } else {
    final responseData = null;
  
    return responseData;
  }
}
Future<List<Map<String, dynamic>>> destinationCityFetchData(destination) async {
 
  var url =
      'https://www.mv-tel.com/MSM_Viaticos_API_Test/api/Ciudad/$destination';

  final response = await http.get(
    Uri.parse(url),
  );
  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    final responseData = CityDestinationList.fromJson(body);
    List<Map<String, dynamic>> myList = [];
    for (var i in responseData.destinations) {
      myList.add({'value': '${i.nombre}', 'label': '${i.nombre}'},);
    }
    
    return myList;
  } else {
    final responseData = null;
    
    return responseData;
  }
}
