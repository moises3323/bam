// To parse this JSON data, do
//
//     final cotizacionModel = cotizacionModelFromMap(jsonString);

import 'dart:convert';

class CotizacionModel {
  CotizacionModel({
    required this.idConcesionario,
    required this.idPersona,
    required this.nombres,
    required this.apellidos,
    required this.sexo,
    required this.edad,
    required this.correo,
    required this.telefono,
    required this.direccion,
    this.descripcion,
  });

  String idConcesionario;
  String idPersona;
  String nombres;
  String apellidos;
  String sexo;
  String edad;
  String correo;
  String telefono;
  String direccion;
  String? descripcion;

  factory CotizacionModel.fromJson(String str) =>
      CotizacionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CotizacionModel.fromMap(Map<String, dynamic> json) => CotizacionModel(
        idConcesionario: json["id_concesionario"],
        idPersona: json["id_persona"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        sexo: json["sexo"],
        edad: json["edad"],
        correo: json["correo"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "id_concesionario": idConcesionario,
        "id_persona": idPersona,
        "nombres": nombres,
        "apellidos": apellidos,
        "sexo": sexo,
        "edad": edad,
        "correo": correo,
        "telefono": telefono,
        "direccion": direccion,
        "descripcion": descripcion ?? '',
      };
}
