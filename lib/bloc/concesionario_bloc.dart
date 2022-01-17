import 'dart:async';

import 'package:bam/models/cotizacion_model.dart';
import 'package:bam/models/marca_model.dart';
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
      final listaFiltrada = listVehiculo
          .where((element) => element.idMarcas == state.marcaSelected)
          .toList();
      emit(
        ConcesionarioSetState(
            listVehiculosModel: listVehiculo,
            marcaSeleccionada: 1,
            listaVehiculos: listaFiltrada),
      );
    });

    on<SelectedVehiculo>((event, emit) async {
      emit(
        ConcesionarioSetState(
          vehiculoSelected: event.selectedVehiculo,
          listVehiculosModel: state.listVehiculos,
          listaVehiculos: state.listaFiltradaVehiculos,
          marcaSeleccionada: state.marcaSelected,
        ),
      );
    });

    on<ListarPorMarca>((event, emit) async {
      final newList = state.listVehiculos
          ?.where((element) => element.idMarcas == event.marcaSelected)
          .toList();
      emit(
        ConcesionarioSetState(
          marcaSeleccionada: event.marcaSelected,
          listVehiculosModel: state.listVehiculos,
          listaVehiculos: newList,
        ),
      );
    });
  }
}
