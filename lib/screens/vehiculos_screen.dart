import 'package:bam/bloc/concesionario_bloc.dart';
import 'package:bam/widgets/car_detail.dart';
import 'package:bam/widgets/slider_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehiculosScreen extends StatefulWidget {
  const VehiculosScreen({Key? key}) : super(key: key);

  @override
  State<VehiculosScreen> createState() => _VehiculosScreenState();
}

class _VehiculosScreenState extends State<VehiculosScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    BlocProvider.of<ConcesionarioBloc>(context).add(ObtenerVehiculos());
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          margin: const EdgeInsets.only(left: 24, top: 16),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Vehículos',
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          Container(
            child: GestureDetector(
              child: Column(children: const [
                Icon(Icons.list_alt, color: Colors.black),
                Text(
                  'Cotizaciones',
                  style: TextStyle(color: Colors.black, fontSize: 10),
                )
              ]),
              onTap: () => Navigator.pushNamed(context, 'cotizaciones'),
            ),
            margin: const EdgeInsets.only(right: 24),
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 88,
            child: Expanded(child: SliderHorizontal()),
          ),
          BlocBuilder<ConcesionarioBloc, ConcesionarioState>(
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  //controller: scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: state.listaFiltradaVehiculos!.length,
                  itemBuilder: (_, int index) => CarDetail(
                    vehiculo: state.listaFiltradaVehiculos![index],
                    onTap: () {
                      BlocProvider.of<ConcesionarioBloc>(context).add(
                          SelectedVehiculo(
                              state.listaFiltradaVehiculos![index]));
                      Navigator.pushNamed(context, 'detalle');
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
