import 'dart:convert';
List<Airports> viajeAsociadoFromJson(String str) => List<Airports>.from(json.decode(str).map((x) => Airports.fromJson(x)));
String viajeAsociadoToJson(List<Airports> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Airports {
    Airports({
        required this.aeropuertoId,
        required this.nombre,
    });

    int aeropuertoId;
    String nombre;

    factory Airports.fromJson(Map<String, dynamic> json) => Airports(
        aeropuertoId: json["aeropuertoId"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "aeropuertoId": aeropuertoId,
        "nombre": nombre,
    };
}

class AirPortsList {
  final List<Airport> airports;

  AirPortsList({
    required this.airports,
});

  factory AirPortsList.fromJson(List<dynamic> parsedJson) {

    List<Airport> airports = [];
    airports = parsedJson.map((i)=>Airport.fromJson(i)).toList();

    return new AirPortsList(
      airports: airports,
    );
  }
}

class Airport{
  Airport({
      required this.aeropuertoId,
      required this.nombre,
}) ;

    int aeropuertoId;
    String nombre;

    factory Airport.fromJson(Map<String, dynamic> json) => Airport(
        aeropuertoId: json["aeropuertoId"],
        nombre: json["nombre"],
    );

}