import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.usuarioId,
        required this.codigoUsuario,
        required this.nombreCodigo,
        required this.cedula,
        required this.email,
        this.nombres,
        required this.dependencia,
        required this.sede,
        required this.ceco,
        required this.empresa,
        required this.extension,
        required this.regimenSalarial,
        required this.cargo,
        required this.tipo,
    });

    int usuarioId;
    String codigoUsuario;
    String nombreCodigo;
    String cedula;
    String email;
    String? nombres;
    String dependencia;
    dynamic sede;
    String ceco;
    String empresa;
    String extension;
    String regimenSalarial;
    String cargo;
    int tipo;

    factory User.fromJson(Map<String, dynamic> json) => User(
        usuarioId: json["usuarioId"],
        codigoUsuario: json["codigoUsuario"],
        nombreCodigo: json["nombreCodigo"],
        cedula: json["cedula"],
        email: json["email"],
        nombres: json["nombres"],
        dependencia: json["dependencia"],
        sede: json["sede"],
        ceco: json["ceco"],
        empresa: json["empresa"],
        extension: json["extension"],
        regimenSalarial: json["regimenSalarial"],
        cargo: json["cargo"],
        tipo: json["tipo"],
    );

    Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "codigoUsuario": codigoUsuario,
        "nombreCodigo": nombreCodigo,
        "cedula": cedula,
        "email": email,
        "nombres": nombres,
        "dependencia": dependencia,
        "sede": sede,
        "ceco": ceco,
        "empresa": empresa,
        "extension": extension,
        "regimenSalarial": regimenSalarial,
        "cargo": cargo,
        "tipo": tipo,
    };
}
