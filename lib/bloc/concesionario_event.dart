part of 'concesionario_bloc.dart';

@immutable
abstract class ConcesionarioEvent {}

class RealizarCotizacion extends ConcesionarioEvent {
  final CotizacionModel cotizacion;
  RealizarCotizacion(this.cotizacion);
}

class ObtenerVehiculos extends ConcesionarioEvent {}

class SelectedVehiculo extends ConcesionarioEvent {
  final VehiculoModel selectedVehiculo;

  SelectedVehiculo(this.selectedVehiculo);
}
