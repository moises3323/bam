// To parse this JSON data, do
//
//     final personaModel = personaModelFromMap(jsonString);

import 'dart:convert';

class PersonaModel {
  PersonaModel({
    required this.idPersona,
    required this.nombres,
    required this.apellidos,
    required this.fechaNacimiento,
    required this.sexo,
    required this.imagen,
    required this.idRol,
  });

  int idPersona;
  String nombres;
  String apellidos;
  DateTime fechaNacimiento;
  String sexo;
  dynamic imagen;
  int idRol;

  factory PersonaModel.fromJson(String str) =>
      PersonaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PersonaModel.fromMap(Map<String, dynamic> json) => PersonaModel(
        idPersona: json["id_persona"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        sexo: json["sexo"],
        imagen: json["imagen"],
        idRol: json["id_rol"],
      );

  Map<String, dynamic> toMap() => {
        "id_persona": idPersona,
        "nombres": nombres,
        "apellidos": apellidos,
        "fecha_nacimiento": fechaNacimiento.toIso8601String(),
        "sexo": sexo,
        "imagen": imagen,
        "id_rol": idRol,
      };
}
