import 'dart:convert';
List<ViajeAsociado> viajeAsociadoFromJson(String str) => List<ViajeAsociado>.from(json.decode(str).map((x) => ViajeAsociado.fromJson(x)));
String viajeAsociadoToJson(List<ViajeAsociado> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViajeAsociado {
    ViajeAsociado({
        required this.cuentaContableId,
        required this.viajeAsociadoAId,
        required this.codigo,
        required this.codigoNombre,
        required this.nombre,
        required this.viajeAsociadoA,
    });

    int cuentaContableId;
    int viajeAsociadoAId;
    String codigo;
    dynamic codigoNombre;
    String nombre;
    dynamic viajeAsociadoA;

    factory ViajeAsociado.fromJson(Map<String, dynamic> json) => ViajeAsociado(
        cuentaContableId: json["cuentaContableId"],
        viajeAsociadoAId: json["viajeAsociadoAId"],
        codigo: json["codigo"],
        codigoNombre: json["codigoNombre"],
        nombre: json["nombre"],
        viajeAsociadoA: json["viajeAsociadoA"],
    );

    Map<String, dynamic> toJson() => {
        "cuentaContableId": cuentaContableId,
        "viajeAsociadoAId": viajeAsociadoAId,
        "codigo": codigo,
        "codigoNombre": codigoNombre,
        "nombre": nombre,
        "viajeAsociadoA": viajeAsociadoA,
    };
}
class ViajeAsociadoList {
  final List<Viaje> viajes;

  ViajeAsociadoList({
    required this.viajes,
});

  factory ViajeAsociadoList.fromJson(List<dynamic> parsedJson) {

    List<Viaje> viajes = [];
    viajes = parsedJson.map((i)=>Viaje.fromJson(i)).toList();

    return new ViajeAsociadoList(
      viajes: viajes
    );
  }
}

class Viaje{
  int cuentaContableId;
  int viajeAsociadoAId;
  String codigo;
  dynamic codigoNombre;
  String nombre;
  dynamic viajeAsociadoA;

  Viaje({
  required this.cuentaContableId,
  required this.viajeAsociadoAId,
  required this.codigo,
  required this.codigoNombre,
  required this.nombre,
  required this.viajeAsociadoA,
}) ;

  factory Viaje.fromJson(Map<String, dynamic> json){
    return new Viaje(
      cuentaContableId: json["cuentaContableId"],
        viajeAsociadoAId: json["viajeAsociadoAId"],
        codigo: json["codigo"],
        codigoNombre: json["codigoNombre"],
        nombre: json["nombre"],
        viajeAsociadoA: json["viajeAsociadoA"],
    );
  }

}