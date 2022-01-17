// To parse this JSON data, do
//
//     final vehiculoModel = vehiculoModelFromMap(jsonString);

import 'dart:convert';

class VehiculoModel {
  VehiculoModel({
    required this.idVehiculo,
    required this.nombre,
    this.descripcion,
    required this.idMarcas,
    required this.idModelo,
    required this.anio,
    required this.imagen,
    required this.peso,
    required this.asientos,
    required this.combustible,
    required this.traccion,
    required this.velocidades,
    required this.modelo,
    required this.marca,
  });

  int idVehiculo;
  String nombre;
  String? descripcion;
  int idMarcas;
  int idModelo;
  int anio;
  String imagen;
  String peso;
  int asientos;
  String combustible;
  String traccion;
  int velocidades;
  Modelo modelo;
  Marca marca;

  factory VehiculoModel.fromJson(String str) =>
      VehiculoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VehiculoModel.fromMap(Map<String, dynamic> json) => VehiculoModel(
        idVehiculo: json["id_vehiculo"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        idMarcas: json["id_marcas"],
        idModelo: json["id_modelo"],
        anio: json["anio"],
        imagen: json["imagen"],
        peso: json["peso"],
        asientos: json["asientos"],
        combustible: json["combustible"],
        traccion: json["traccion"],
        velocidades: json["velocidades"],
        modelo: Modelo.fromMap(json["modelo"]),
        marca: Marca.fromMap(json["marca"]),
      );

  Map<String, dynamic> toMap() => {
        "id_vehiculo": idVehiculo,
        "nombre": nombre,
        "descripcion": descripcion,
        "id_marcas": idMarcas,
        "id_modelo": idModelo,
        "anio": anio,
        "imagen": imagen,
        "peso": peso,
        "asientos": asientos,
        "combustible": combustible,
        "traccion": traccion,
        "velocidades": velocidades,
        "modelo": modelo.toMap(),
        "marca": marca.toMap(),
      };
}

class Marca {
  Marca({
    required this.idMarcas,
    required this.descripcion,
  });

  int idMarcas;
  String descripcion;

  factory Marca.fromJson(String str) => Marca.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Marca.fromMap(Map<String, dynamic> json) => Marca(
        idMarcas: json["id_marcas"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "id_marcas": idMarcas,
        "descripcion": descripcion,
      };
}

class Modelo {
  Modelo({
    required this.idModelo,
    required this.descripcion,
  });

  int idModelo;
  String descripcion;

  factory Modelo.fromJson(String str) => Modelo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Modelo.fromMap(Map<String, dynamic> json) => Modelo(
        idModelo: json["id_modelo"],
        descripcion: json["descripcion"],
      );

  Map<String, dynamic> toMap() => {
        "id_modelo": idModelo,
        "descripcion": descripcion,
      };
}
