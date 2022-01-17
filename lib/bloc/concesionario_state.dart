part of 'concesionario_bloc.dart';

@immutable
abstract class ConcesionarioState {
  final CotizacionModel? cotizacion;
  final List<VehiculoModel>? listVehiculos;
  final VehiculoModel? selectedVehiculo;
  final int? marcaSelected;
  final List<VehiculoModel>? listaFiltradaVehiculos;
  final List<CotizacionReponseModel>? listaCotizacionesAll;

  const ConcesionarioState(
      {this.cotizacion,
      this.listVehiculos,
      this.selectedVehiculo,
      this.marcaSelected,
      this.listaFiltradaVehiculos,
      this.listaCotizacionesAll});
}

class ConcesionarioInitialState extends ConcesionarioState {
  ConcesionarioInitialState()
      : super(
            cotizacion: null,
            listVehiculos: [],
            selectedVehiculo: null,
            marcaSelected: 1,
            listaFiltradaVehiculos: [],
            listaCotizacionesAll: []);
}

class ConcesionarioSetState extends ConcesionarioState {
  final CotizacionModel? cotizacionModel;
  final List<VehiculoModel>? listVehiculosModel;
  final VehiculoModel? vehiculoSelected;
  final int? marcaSeleccionada;
  final List<VehiculoModel>? listaVehiculos;
  final List<CotizacionReponseModel>? listaCotizacionesAllLocal;

  const ConcesionarioSetState(
      {this.cotizacionModel,
      this.listVehiculosModel,
      this.vehiculoSelected,
      this.marcaSeleccionada,
      this.listaVehiculos,
      this.listaCotizacionesAllLocal})
      : super(
            cotizacion: cotizacionModel,
            listVehiculos: listVehiculosModel,
            selectedVehiculo: vehiculoSelected,
            marcaSelected: marcaSeleccionada,
            listaFiltradaVehiculos: listaVehiculos,
            listaCotizacionesAll: listaCotizacionesAllLocal);
}
