import 'package:bam/models/concesionarias_model.dart';
import 'package:bam/models/cotizacion_model.dart';
import 'package:bam/models/cotizacion_response_model.dart';
import 'package:bam/models/persona_model.dart';
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
            marcaSeleccionada: state.marcaSelected,
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

    on<ListarCotizaciones>((event, emit) async {
      final listCotizaciones = await concesionarioService.getCotizacionesAll();
      emit(
        ConcesionarioSetState(
            marcaSeleccionada: state.marcaSelected,
            listVehiculosModel: state.listVehiculos,
            listaVehiculos: state.listVehiculos,
            listaCotizacionesAllLocal: listCotizaciones),
      );
    });

    on<CargarCatalogos>((event, emit) async {
      final listConcesionarias =
          await concesionarioService.getConcesionariasCatalogo();
      final listPersonas = await concesionarioService.getPersonasCatalogo();

      emit(
        ConcesionarioSetState(
            marcaSeleccionada: state.marcaSelected,
            listVehiculosModel: state.listVehiculos,
            listaVehiculos: state.listVehiculos,
            listaCotizacionesAllLocal: state.listaCotizacionesAll,
            concecionariasCatalogoLocal: listConcesionarias,
            personaCatalogoLocal: listPersonas,
            vehiculoSelected: state.selectedVehiculo),
      );
    });
  }
}
