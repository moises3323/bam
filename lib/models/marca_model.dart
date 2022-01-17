// To parse this JSON data, do
//
//     final marcaModel = marcaModelFromMap(jsonString);

import 'dart:convert';

class MarcaModel {
  MarcaModel({
    required this.idMarcas,
    required this.descripcion,
    this.imagen,
  });

  int idMarcas;
  String descripcion;
  String? imagen;

  factory MarcaModel.fromJson(String str) =>
      MarcaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MarcaModel.fromMap(Map<String, dynamic> json) => MarcaModel(
        idMarcas: json["id_marcas"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toMap() => {
        "id_marcas": idMarcas,
        "descripcion": descripcion,
        "imagen": imagen,
      };
}
