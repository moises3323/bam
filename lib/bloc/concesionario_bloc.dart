import 'dart:async';

import 'package:bam/models/cotizacion_model.dart';
import 'package:bam/models/vehiculo_model.dart';
import 'package:bam/services/concesionario_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'concesionario_event.dart';
part 'concesionario_state.dart';

class ConcesionarioBloc extends Bloc<ConcesionarioEvent, ConcesionarioState> {
  final concesionarioService = ConcesionarioService();

  ConcesionarioBloc() : super(ConcesionarioInitialState()) {
    on<RealizarCotizacion>((event, emit) async {
      await concesionarioService.postCotizacion(event.cotizacion);
    });

    on<ObtenerVehiculos>((event, emit) async {
      final listVehiculo = await concesionarioService.getVehiculos();
      emit(
        ConcesionarioSetState(
          listVehiculosModel: listVehiculo,
        ),
      );
    });

    on<SelectedVehiculo>((event, emit) async {
      emit(
        ConcesionarioSetState(
          vehiculoSelected: event.selectedVehiculo,
          listVehiculosModel: state.listVehiculos,
        ),
      );
    });
  }
}
