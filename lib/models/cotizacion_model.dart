// To parse this JSON data, do
//
//     final cotizacionModel = cotizacionModelFromMap(jsonString);

import 'dart:convert';

class CotizacionModel {
  CotizacionModel({
    this.idConcesionario,
    this.idPersona,
    this.idVehiculo,
    this.nombres,
    this.apellidos,
    this.sexo,
    this.edad,
    this.correo,
    this.telefono,
    this.direccion,
    this.descripcion,
  });

  String? idConcesionario;
  String? idPersona;
  String? idVehiculo;
  String? nombres;
  String? apellidos;
  String? sexo;
  String? edad;
  String? correo;
  String? telefono;
  String? direccion;
  String? descripcion;

  factory CotizacionModel.fromJson(String str) =>
      CotizacionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CotizacionModel.fromMap(Map<String, dynamic> json) => CotizacionModel(
        idConcesionario: json["id_concesionario"],
        idPersona: json["id_persona"],
        idVehiculo: json["id_vehiculo"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        sexo: json["sexo"] ?? '',
        edad: json["edad"] ?? '0',
        correo: json["correo"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "id_concesionario": idConcesionario ?? '1',
        "id_persona": idPersona ?? '1',
        "id_vehiculo": idVehiculo,
        "nombres": nombres ?? '',
        "apellidos": apellidos ?? '',
        "sexo": sexo ?? '',
        "edad": edad ?? '0',
        "correo": correo ?? '',
        "telefono": telefono ?? '',
        "direccion": direccion ?? '',
        "descripcion": descripcion ?? '',
      };
}
