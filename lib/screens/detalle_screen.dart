import 'package:bam/widgets/button.dart';
import 'package:bam/widgets/car_detail.dart';
import 'package:flutter/material.dart';

class DetalleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 375,
          child: const Text(
            'Detalle',
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600),
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
      body: Column(
        children: [
          CarDetail(),
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
              children: const [
                Text('Peso: 1,885kg'),
                Text('Asientos: 4'),
                Text('Combustible: gasolina'),
                Text('Tracción: Trasera'),
                Text('Velocidades: 6'),
              ],
            ),
          ),
          const SizedBox(height: 150),
          ButtonStyled(
            onPressed: () => Navigator.pushNamed(context, 'cotizacion'),
            textButton: 'COTIZAR',
          )
        ],
      ),
    );
  }
}
