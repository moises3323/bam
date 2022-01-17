import 'package:flutter/material.dart';

class SliderHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> marcas = {
      '1': 'assets/toyota.png',
      '2': 'assets/volvo.png',
      '3': 'assets/honda.png',
      '4': 'assets/chevrolet.png',
      '5': 'assets/maserati.png',
      '6': 'assets/mercedes.png',
    };
    generarLista() {
      final List<Widget> lista = [];
      marcas.forEach((key, value) {
        lista.add(GestureDetector(
          /* onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie), */
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: Column(
              children: [
                Image(
                  image: AssetImage(value),
                  width: 64,
                  height: 64,
                  //fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: key == '1' ? Colors.black : Colors.white,
                      shape: BoxShape.circle),
                  width: 12,
                  height: 12,
                )
              ],
            ),
          ),
        ));
      });
      return lista;
    }

    return Container(
      /* width: 64,*/
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: generarLista(),
      ),
    );
  }
}
