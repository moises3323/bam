import 'package:bam/bloc/concesionario_bloc.dart';
import 'package:bam/models/vehiculo_model.dart';
import 'package:bam/widgets/button.dart';
import 'package:bam/widgets/car_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetalleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            width: 375,
            child: const Text(
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
                child: Icon(Icons.arrow_back, color: Colors.black),
                onTap: () => Navigator.pop(context),
              ),
              margin: EdgeInsets.only(right: 24),
            )
          ],
          elevation: 0,
        ),
        body: BlocBuilder<ConcesionarioBloc, ConcesionarioState>(
          builder: (context, state) {
            final VehiculoModel vehiculo = state.selectedVehiculo!;
            return Column(
              children: [
                CarDetail(
                  vehiculo: vehiculo,
                  onTap: () {},
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: 340,
                  child: const Text(
                    'Especificaciones',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
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
