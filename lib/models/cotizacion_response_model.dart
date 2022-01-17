// To parse this JSON data, do
//
//     final cotizacionReponseModel = cotizacionReponseModelFromMap(jsonString);

import 'dart:convert';

class CotizacionReponseModel {
  CotizacionReponseModel({
    required this.idCotizacion,
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
    required this.idVehiculo,
    required this.concesionaria,
    required this.persona,
    required this.vehiculo,
  });

  int idCotizacion;
  int idConcesionario;
  int idPersona;
  String nombres;
  String apellidos;
  String sexo;
  int edad;
  String correo;
  String telefono;
  String direccion;
  String? descripcion;
  int idVehiculo;
  Concesionaria concesionaria;
  Persona persona;
  Vehiculo vehiculo;

  factory CotizacionReponseModel.fromJson(String str) =>
      CotizacionReponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CotizacionReponseModel.fromMap(Map<String, dynamic> json) =>
      CotizacionReponseModel(
        idCotizacion: json["id_cotizacion"],
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
        idVehiculo: json["id_vehiculo"],
        concesionaria: Concesionaria.fromMap(json["concesionaria"]),
        persona: Persona.fromMap(json["persona"]),
        vehiculo: Vehiculo.fromMap(json["vehiculo"]),
      );

  Map<String, dynamic> toMap() => {
        "id_cotizacion": idCotizacion,
        "id_concesionario": idConcesionario,
        "id_persona": idPersona,
        "nombres": nombres,
        "apellidos": apellidos,
        "sexo": sexo,
        "edad": edad,
        "correo": correo,
        "telefono": telefono,
        "direccion": direccion,
        "descripcion": descripcion,
        "id_vehiculo": idVehiculo,
        "concesionaria": concesionaria.toMap(),
        "persona": persona.toMap(),
        "vehiculo": vehiculo.toMap(),
      };
}

class Concesionaria {
  Concesionaria({
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

  factory Concesionaria.fromJson(String str) =>
      Concesionaria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Concesionaria.fromMap(Map<String, dynamic> json) => Concesionaria(
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

class Persona {
  Persona({
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

  factory Persona.fromJson(String str) => Persona.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Persona.fromMap(Map<String, dynamic> json) => Persona(
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

class Vehiculo {
  Vehiculo({
    required this.idVehiculo,
    required this.nombre,
    required this.descripcion,
    required this.idMarcas,
    required this.idModelo,
    required this.anio,
    required this.imagen,
    required this.peso,
    required this.asientos,
    required this.combustible,
    required this.traccion,
    required this.velocidades,
  });

  int idVehiculo;
  String nombre;
  String descripcion;
  int idMarcas;
  int idModelo;
  int anio;
  String imagen;
  String peso;
  int asientos;
  String combustible;
  String traccion;
  int velocidades;

  factory Vehiculo.fromJson(String str) => Vehiculo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vehiculo.fromMap(Map<String, dynamic> json) => Vehiculo(
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
      };
}
