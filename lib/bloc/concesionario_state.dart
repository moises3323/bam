part of 'concesionario_bloc.dart';

@immutable
abstract class ConcesionarioState {
  final CotizacionModel? cotizacion;
  final List<VehiculoModel>? listVehiculos;
  final VehiculoModel? selectedVehiculo;
  final int? marcaSelected;
  final List<VehiculoModel>? listaFiltradaVehiculos;
  final List<CotizacionReponseModel>? listaCotizacionesAll;
  final List<ConcesionariasModel>? concecionariasCatalogo;
  final List<PersonaModel>? personaCatalogo;
  final bool? isSaved;

  const ConcesionarioState({
    this.cotizacion,
    this.listVehiculos,
    this.selectedVehiculo,
    this.marcaSelected,
    this.listaFiltradaVehiculos,
    this.listaCotizacionesAll,
    this.concecionariasCatalogo,
    this.personaCatalogo,
    this.isSaved,
  });
}

class ConcesionarioInitialState extends ConcesionarioState {
  ConcesionarioInitialState()
      : super(
          cotizacion: null,
          listVehiculos: [],
          selectedVehiculo: null,
          marcaSelected: 1,
          listaFiltradaVehiculos: [],
          listaCotizacionesAll: [],
          concecionariasCatalogo: [],
          personaCatalogo: [],
          isSaved: false,
        );
}

class ConcesionarioSetState extends ConcesionarioState {
  final CotizacionModel? cotizacionModel;
  final List<VehiculoModel>? listVehiculosModel;
  final VehiculoModel? vehiculoSelected;
  final int? marcaSeleccionada;
  final List<VehiculoModel>? listaVehiculos;
  final List<CotizacionReponseModel>? listaCotizacionesAllLocal;
  final List<ConcesionariasModel>? concecionariasCatalogoLocal;
  final List<PersonaModel>? personaCatalogoLocal;
  final bool? saved;

  const ConcesionarioSetState(
      {this.cotizacionModel,
      this.listVehiculosModel,
      this.vehiculoSelected,
      this.marcaSeleccionada,
      this.listaVehiculos,
      this.listaCotizacionesAllLocal,
      this.concecionariasCatalogoLocal,
      this.personaCatalogoLocal,
      this.saved})
      : super(
          cotizacion: cotizacionModel,
          listVehiculos: listVehiculosModel,
          selectedVehiculo: vehiculoSelected,
          marcaSelected: marcaSeleccionada,
          listaFiltradaVehiculos: listaVehiculos,
          listaCotizacionesAll: listaCotizacionesAllLocal,
          concecionariasCatalogo: concecionariasCatalogoLocal,
          personaCatalogo: personaCatalogoLocal,
          isSaved: saved,
        );
}
