part of 'concesionario_bloc.dart';

@immutable
abstract class ConcesionarioState {
  final CotizacionModel? cotizacion;
  final List<VehiculoModel>? listVehiculos;
  final VehiculoModel? selectedVehiculo;

  const ConcesionarioState({
    this.cotizacion,
    this.listVehiculos,
    this.selectedVehiculo,
  });
}

class ConcesionarioInitialState extends ConcesionarioState {
  ConcesionarioInitialState() : super(cotizacion: null, listVehiculos: []);
}

class ConcesionarioSetState extends ConcesionarioState {
  final CotizacionModel? cotizacionModel;
  final List<VehiculoModel>? listVehiculosModel;
  final VehiculoModel? vehiculoSelected;

  const ConcesionarioSetState({
    this.cotizacionModel,
    this.listVehiculosModel,
    this.vehiculoSelected,
  }) : super(
          cotizacion: cotizacionModel,
          listVehiculos: listVehiculosModel,
          selectedVehiculo: vehiculoSelected,
        );
}
