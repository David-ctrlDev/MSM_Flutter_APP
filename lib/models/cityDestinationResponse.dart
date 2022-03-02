import 'dart:convert';
List<CityDestination> viajeAsociadoFromJson(String str) => List<CityDestination>.from(json.decode(str).map((x) => CityDestination.fromJson(x)));
String viajeAsociadoToJson(List<CityDestination> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityDestination {
    CityDestination({
        required this.id,
        required this.nombre,
        required this.paisId,
        required this.departamento,
        required this.poblacion,
        required this.destinos,
       
    });

    int id;
    String nombre;
    String paisId;
    String departamento;
    int poblacion;
    dynamic destinos;

    factory CityDestination.fromJson(Map<String, dynamic> json) => CityDestination(
        id: json["id"],
        nombre: json["nombre"],
        paisId: json["paisId"],
        departamento: json["departamento"],
        poblacion: json["poblacion"],
        destinos: json["destinos"],
    );

    Map<String, dynamic> toJson() => {
         "id": id,
        "nombre": nombre,
        "paisId": paisId,
        "departamento": departamento,
        "poblacion": poblacion,
        "destinos": destinos,
    };
}
class CityDestinationList {
  final List<City> destinations;

  CityDestinationList({
    required this.destinations,
});

  factory CityDestinationList.fromJson(List<dynamic> parsedJson) {

    List<City> destinations = [];
    destinations = parsedJson.map((i)=>City.fromJson(i)).toList();

    return new CityDestinationList(
      destinations: destinations,
    );
  }
}

class City{
  City({
        required this.id,
        required this.nombre,
        required this.paisId,
        required this.departamento,
        required this.poblacion,
        required this.destinos,
}) ;

    int id;
    String nombre;
    String paisId;
    String departamento;
    int poblacion;
    dynamic destinos;

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        nombre: json["nombre"],
        paisId: json["paisId"],
        departamento: json["departamento"],
        poblacion: json["poblacion"],
        destinos: json["destinos"],
    );

}