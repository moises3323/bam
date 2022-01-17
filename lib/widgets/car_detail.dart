import 'package:bam/models/vehiculo_model.dart';
import 'package:flutter/material.dart';

class CarDetail extends StatelessWidget {
  final VehiculoModel vehiculo;
  final Function onTap;
  const CarDetail({Key? key, required this.vehiculo, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        GestureDetector(
          onTap: () => onTap(),
          child: FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'),
            image: NetworkImage(vehiculo.imagen),
            height: 260,
            width: 260,
          ),
        ),
        SizedBox(
          width: 375,
          child: Text(
            vehiculo.nombre,
            style: const TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          width: 375,
          child: Text(
            vehiculo.descripcion ?? '--6+',
            style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.left,
          ),
        ),
      ]),
    );
  }
}
