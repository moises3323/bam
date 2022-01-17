import 'package:bam/bloc/concesionario_bloc.dart';
import 'package:bam/models/cotizacion_model.dart';
import 'package:bam/styles/inputs_style.dart';
import 'package:bam/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CotizacionScreen extends StatelessWidget {
  const CotizacionScreen({Key? key}) : super(key: key);

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
              onTap: () => Navigator.pop(context),
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
              children: [_HeaderImage(), _Form()],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  _Form({Key? key}) : super(key: key);

  Map<String, dynamic> form = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Select(form: form, name: 'id_concesionario'),
        _Select(bottom: 16, form: form, name: 'id_persona'),
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            'Datos del cliente',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Input(form: form, name: 'nombres', hintText: 'Nombres'),
        Input(form: form, name: 'apellidos', hintText: 'Apellidos'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 157,
              child: _Select(form: form, name: 'sexo'),
            ),
            Container(
              width: 157,
              child: Input(form: form, name: 'edad', hintText: 'Edad'),
            ),
            //Input(),
          ],
        ),
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
            BlocProvider.of<ConcesionarioBloc>(context)
                .add(RealizarCotizacion(CotizacionModel.fromMap(form)));
          },
          textButton: 'REALIZAR COTIZACIÓN',
          bottom: 24,
        )
      ],
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
        builder: (context, state) {
      final vehiculo = state.selectedVehiculo!;
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeInImage(
              width: 64,
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(vehiculo.imagen),
            ),
            Text(
              vehiculo.nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            FadeInImage(
              width: 64,
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(vehiculo.imagen),
            ),
          ],
        ),
      );
    });
  }
}

class _Select extends StatelessWidget {
  _Select(
      {Key? key,
      required this.form,
      required this.name,
      this.top = 12.0,
      this.bottom = 0})
      : super(key: key);

  final double top;
  final double bottom;
  final String name;
  Map<String, dynamic> form;
  String dropdownValue = '1';
  @override
  Widget build(BuildContext context) {
    return Container(
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
        items: <String>['1', '2', '3', '4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(child: Text(value)),
          );
        }).toList(),
      ),
    );
  }
}

class Input extends StatelessWidget {
  final String hintText;
  final double top;
  final double bottom;
  final String name;
  Map<String, dynamic> form;

  Input(
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
