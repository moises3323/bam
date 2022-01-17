import 'package:bam/bloc/concesionario_bloc.dart';
import 'package:bam/models/cotizacion_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CotizacionesList extends StatefulWidget {
  const CotizacionesList({Key? key}) : super(key: key);

  @override
  State<CotizacionesList> createState() => _CotizacionesListState();
}

class _CotizacionesListState extends State<CotizacionesList> {
  @override
  void initState() {
    BlocProvider.of<ConcesionarioBloc>(context).add(ListarCotizaciones());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const SizedBox(
            width: 375,
            child: Text(
              'Lista de cotizaciones',
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
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.listaCotizacionesAll?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return _CardCotizacion(state.listaCotizacionesAll![index]);
              },
            );
          },
        ));
  }
}

class _CardCotizacion extends StatelessWidget {
  final CotizacionReponseModel cotizacion;

  const _CardCotizacion(this.cotizacion, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 10), blurRadius: 12)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FadeInImage(
              width: 130,
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(cotizacion.vehiculo.imagen)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cotizacion.concesionaria.nombre,
                  style: const TextStyle(fontSize: 20),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Text('CLIENTE'),
                Text('${cotizacion.nombres} ${cotizacion.apellidos}'),
                Text('Tel: ${cotizacion.telefono}'),
                Text(cotizacion.correo),
                Text('Dirección: ${cotizacion.telefono}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
