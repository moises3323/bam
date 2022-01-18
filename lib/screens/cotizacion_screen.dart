import 'package:bam/bloc/concesionario_bloc.dart';
import 'package:bam/models/concesionarias_model.dart';
import 'package:bam/models/cotizacion_model.dart';
import 'package:bam/models/persona_model.dart';
import 'package:bam/styles/inputs_style.dart';
import 'package:bam/utlis/utils_constants.dart';
import 'package:bam/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CotizacionScreen extends StatefulWidget {
  const CotizacionScreen({Key? key}) : super(key: key);

  @override
  State<CotizacionScreen> createState() => _CotizacionScreenState();
}

class _CotizacionScreenState extends State<CotizacionScreen> {
  @override
  void initState() {
    BlocProvider.of<ConcesionarioBloc>(context).add(CargarCatalogos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          margin: const EdgeInsets.only(left: 24, top: 16),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Cotización',
            style: TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          Container(
            child: GestureDetector(
              child: const Icon(Icons.arrow_back, color: Colors.black),
              onTap: () => Navigator.pushReplacementNamed(context, 'detalle'),
            ),
            margin: const EdgeInsets.only(right: 24),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const _HeaderImage(),
                BlocBuilder<ConcesionarioBloc, ConcesionarioState>(
                  builder: (context, state) {
                    return _Form(state);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  final ConcesionarioState state;
  _Form(this.state, {Key? key}) : super(key: key);

  final Map<String, dynamic> form = {};

  @override
  Widget build(BuildContext context) {
    final personaCatalogo = state.personaCatalogo ?? [];
    final concecionariasCatalogo = state.concecionariasCatalogo ?? [];
    return BlocBuilder<ConcesionarioBloc, ConcesionarioState>(
      builder: (context, state) {
        return Column(
          children: [
            _Select(
              form: form,
              name: 'id_concesionario',
              items: concecionariasCatalogo.map((ConcesionariasModel value) {
                return DropdownMenuItem(
                  value: value.idConcesionario.toString(),
                  child: SizedBox(height: 32, child: Text(value.nombre)),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            _Select(
              bottom: 16,
              form: form,
              name: 'id_persona',
              items: personaCatalogo.map((PersonaModel value) {
                return DropdownMenuItem(
                  value: value.idPersona.toString(),
                  child: SizedBox(height: 32, child: Text(value.nombres)),
                );
              }).toList(),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Datos del cliente',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Input(form: form, name: 'nombres', hintText: 'Nombres'),
            Input(form: form, name: 'apellidos', hintText: 'Apellidos'),
            Input(form: form, name: 'correo', hintText: 'Correo'),
            Input(form: form, name: 'telefono', hintText: 'Teléfono'),
            Input(
              form: form,
              name: 'direccion',
              hintText: 'Dirección',
              bottom: 24,
            ),
            ButtonStyled(
              onPressed: () {
                FocusScope.of(context).unfocus();
                // final state = BlocProvider.of<ConcesionarioBloc>(context).state;
                final idVehiculo = state.selectedVehiculo!.idVehiculo;
                form['id_vehiculo'] = idVehiculo.toString();
                BlocProvider.of<ConcesionarioBloc>(context)
                    .add(RealizarCotizacion(CotizacionModel.fromMap(form)));

                Navigator.pushReplacementNamed(context, 'vehiculos');
              },
              textButton: 'REALIZAR COTIZACIÓN',
              bottom: 24,
            )
          ],
        );
      },
    );
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConcesionarioBloc, ConcesionarioState>(
        buildWhen: (previous, current) =>
            current.selectedVehiculo != null &&
            previous.selectedVehiculo != current.selectedVehiculo,
        builder: (context, state) {
          final vehiculo = state.selectedVehiculo!;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInImage(
                  width: 64,
                  placeholder: const AssetImage('assets/nube.gif'),
                  image: AssetImage(
                      UtilsContants.marcas[vehiculo.idMarcas.toInt()]!),
                ),
                Text(
                  vehiculo.nombre,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                FadeInImage(
                  width: 64,
                  placeholder: const AssetImage('assets/nube.gif'),
                  image: NetworkImage(vehiculo.imagen),
                ),
              ],
            ),
          );
        });
  }
}

class _Select extends StatelessWidget {
  const _Select({
    Key? key,
    required this.form,
    required this.name,
    this.top = 12.0,
    this.bottom = 0,
    required this.items,
  }) : super(key: key);

  final double top;
  final double bottom;
  final String name;
  final Map<String, dynamic> form;
  final String dropdownValue = '1';
  final List<DropdownMenuItem<String>> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Elir cclasdjflasjdlf',
        ),
        Container(
          margin: EdgeInsets.only(top: top, bottom: bottom),
          height: 50,
          child: DropdownButtonFormField(
              decoration: InputStyle.decoration(),
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              style: const TextStyle(color: Colors.black, fontSize: 10),
              hint: const Text('Elegir concesionario'),
              onChanged: (String? newValue) {
                form[name] = newValue;
              },
              items: items),
        ),
      ],
    );
  }
}

class Input extends StatelessWidget {
  final String hintText;
  final double top;
  final double bottom;
  final String name;
  final Map<String, dynamic> form;

  const Input(
      {Key? key,
      required this.form,
      required this.name,
      required this.hintText,
      this.top = 12.0,
      this.bottom = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
        bottom: bottom,
      ),
      height: 46,
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputStyle.decoration(hintText: hintText),
        onChanged: (String? newValue) {
          form[name] = newValue;
        },
      ),
    );
  }
}
