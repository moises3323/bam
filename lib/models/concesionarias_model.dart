// To parse this JSON data, do
//
//     final concesionariasModel = concesionariasModelFromMap(jsonString);

import 'dart:convert';

class ConcesionariasModel {
  ConcesionariasModel({
    required this.idConcesionario,
    required this.nombre,
    required this.descripcion,
    required this.direccion,
    required this.idDepartamento,
    required this.idMunicipio,
  });

  int idConcesionario;
  String nombre;
  String descripcion;
  String direccion;
  int idDepartamento;
  int idMunicipio;

  factory ConcesionariasModel.fromJson(String str) =>
      ConcesionariasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConcesionariasModel.fromMap(Map<String, dynamic> json) =>
      ConcesionariasModel(
        idConcesionario: json["id_concesionario"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        direccion: json["direccion"],
        idDepartamento: json["id_departamento"],
        idMunicipio: json["id_municipio"],
      );

  Map<String, dynamic> toMap() => {
        "id_concesionario": idConcesionario,
        "nombre": nombre,
        "descripcion": descripcion,
        "direccion": direccion,
        "id_departamento": idDepartamento,
        "id_municipio": idMunicipio,
      };
}
