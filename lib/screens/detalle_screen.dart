import 'package:bam/bloc/concesionario_bloc.dart';
import 'package:bam/models/vehiculo_model.dart';
import 'package:bam/widgets/button.dart';
import 'package:bam/widgets/car_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetalleScreen extends StatelessWidget {
  const DetalleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const SizedBox(
            width: 375,
            child: Text(
              'Detalle',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
          ),
          actions: [
            Container(
              child: GestureDetector(
                child: const Icon(Icons.arrow_back, color: Colors.black),
                onTap: () => Navigator.pop(context),
              ),
              margin: const EdgeInsets.only(right: 24),
            )
          ],
          elevation: 0,
        ),
        body: BlocBuilder<ConcesionarioBloc, ConcesionarioState>(
          buildWhen: (previous, current) => current.selectedVehiculo != null,
          builder: (context, state) {
            final VehiculoModel vehiculo = state.selectedVehiculo!;
            return Column(
              children: [
                CarDetail(
                  vehiculo: vehiculo,
                  onTap: () {},
                ),
                const SizedBox(height: 16.0),
                const SizedBox(
                  width: 340,
                  child: Text(
                    'Especificaciones',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 90,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Text('Peso: ${vehiculo.peso}'),
                      Text('Asientos: ${vehiculo.asientos}'),
                      Text('Combustible: ${vehiculo.combustible}'),
                      Text('Tracción: ${vehiculo.traccion}'),
                      Text('Velocidades: ${vehiculo.velocidades}'),
                    ],
                  ),
                ),
                const SizedBox(height: 150),
                ButtonStyled(
                  onPressed: () => Navigator.pushNamed(context, 'cotizacion'),
                  textButton: 'COTIZAR',
                )
              ],
            );
          },
        ));
  }
}
