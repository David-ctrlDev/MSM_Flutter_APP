import 'package:http/http.dart' as http;

Future fetchData(password, user) async {
  print(password + user);
  dynamic data =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/ditto'));

  return data;
}
