import 'dart:convert';
List<Destination> viajeAsociadoFromJson(String str) => List<Destination>.from(json.decode(str).map((x) => Destination.fromJson(x)));
String viajeAsociadoToJson(List<Destination> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Destination {
    Destination({
        required this.id,
        required this.nombre,
        required this.poblacion,
        required this.ciudadId,
        required this.ciudadNavigation,
       
    });

    String id;
    String nombre;
    int poblacion;
    int ciudadId;
    dynamic ciudadNavigation;

    factory Destination.fromJson(Map<String, dynamic> json) => Destination(
      id: json["id"],
        nombre: json["nombre"],
        poblacion: json["poblacion"],
        ciudadId: json["ciudadId"],
        ciudadNavigation: json["ciudadNavigation"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "poblacion": poblacion,
        "ciudadId": ciudadId,
        "ciudadNavigation": ciudadNavigation,
    };
}
class DestinationList {
  final List<Country> destinations;

  DestinationList({
    required this.destinations,
});

  factory DestinationList.fromJson(List<dynamic> parsedJson) {

    List<Country> destinations = [];
    destinations = parsedJson.map((i)=>Country.fromJson(i)).toList();

    return new DestinationList(
      destinations: destinations,
    );
  }
}

class Country{
  Country({
        required this.id,
        required this.nombre,
        required this.poblacion,
        required this.ciudadId,
        required this.ciudadNavigation,
}) ;

    String id;
    String nombre;
    int poblacion;
    dynamic ciudadId;
    dynamic ciudadNavigation;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
      id: json["id"],
        nombre: json["nombre"],
        poblacion: json["poblacion"],
        ciudadId: json["ciudadId"],
        ciudadNavigation: json["ciudadNavigation"],
    );

}