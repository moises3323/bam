import 'dart:convert';

import 'package:bam/models/cotizacion_model.dart';
import 'package:bam/models/cotizacion_response_model.dart';
import 'package:bam/models/vehiculo_model.dart';
import 'package:http/http.dart' as http;

class ConcesionarioService {
  final String _baseUrl = '23.92.29.204:10325';

  Future<bool> postCotizacion(CotizacionModel cotizacion) async {
    final url = Uri.http(_baseUrl, '/cotizaciones');

    try {
      final data = cotizacion.toMap();
      await http.post(url, body: data);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<VehiculoModel>> getVehiculos() async {
    final url = Uri.http(_baseUrl, '/vehiculos');
    try {
      final res = await http.get(url);
      final respuesta = json.decode(res.body);
      final List data = respuesta['data'];
      final listVehiculo = data.map((e) => VehiculoModel.fromMap(e)).toList();
      return listVehiculo;
    } catch (e) {
      return [];
    }
  }

  Future<List<CotizacionReponseModel>> getCotizacionesAll() async {
    final url = Uri.http(_baseUrl, '/cotizaciones');
    try {
      final res = await http.get(url);
      final respuesta = json.decode(res.body);
      final List data = respuesta['data'];
      final listCotizaciones =
          data.map((e) => CotizacionReponseModel.fromMap(e)).toList();
      return listCotizaciones;
    } catch (e) {
      return [];
    }
  }
}
