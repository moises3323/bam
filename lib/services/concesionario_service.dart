import 'dart:convert';

import 'package:bam/models/cotizacion_model.dart';
import 'package:bam/models/vehiculo_model.dart';
import 'package:http/http.dart' as http;

class ConcesionarioService {
  final String _baseUrl = '23.92.29.204:10325';

  Future<bool> postCotizacion(CotizacionModel cotizacion) async {
    final url = Uri.http(_baseUrl, '/cotizaciones');

    try {
      final data = cotizacion.toJson();
      final res = await http.post(url, body: cotizacion.toJson());
      print(res);
      return true;
    } catch (e) {
      print(e);
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
      print(e);
      return [];
    }
  }
}
