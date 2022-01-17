import 'package:bam/bloc/concesionario_bloc.dart';
import 'package:bam/utlis/utils_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderHorizontal extends StatelessWidget {
  const SliderHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    generarLista() {
      final List<Widget> lista = [];
      UtilsContants.marcas.forEach((key, value) {
        lista.add(GestureDetector(
          onTap: () => BlocProvider.of<ConcesionarioBloc>(context)
              .add(ListarPorMarca(key)),
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            child: Column(
              children: [
                Image(
                  image: AssetImage(value),
                  width: 64,
                  height: 64,
                  //fit: BoxFit.cover,
                ),
                BlocBuilder<ConcesionarioBloc, ConcesionarioState>(
                  builder: (context, state) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: key == state.marcaSelected
                              ? Colors.black
                              : Colors.white,
                          shape: BoxShape.circle),
                      width: 12,
                      height: 12,
                    );
                  },
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
