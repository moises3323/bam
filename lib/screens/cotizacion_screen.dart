import 'package:bam/styles/inputs_style.dart';
import 'package:bam/widgets/button.dart';
import 'package:flutter/material.dart';

class CotizacionScreen extends StatelessWidget {
  const CotizacionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: const [_HeaderImage(), _Form()],
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  const _Form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Select(),
        Select(
          bottom: 16,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            'Datos del cliente',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Input(hintText: 'Nombres'),
        Input(hintText: 'Apellidos'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 157,
              child: Input(hintText: 'Sexo'),
            ),
            Container(
              width: 157,
              child: Input(hintText: 'Edad'),
            ),
            //Input(),
          ],
        ),
        Input(hintText: 'Correo'),
        Input(hintText: 'Teléfono'),
        Input(
          hintText: 'Dirección',
          bottom: 24,
        ),
        ButtonStyled(
          onPressed: () {},
          textButton: 'REALIZAR COTIZACIÓN',
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const FadeInImage(
            width: 64,
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://bam.imgix.net/maserati/marcas.png'),
          ),
          const Text(
            'Ghibli',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const FadeInImage(
              width: 64,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://bam.imgix.net/ghibli.png')),
        ],
      ),
    );
  }
}

class Select extends StatefulWidget {
  const Select({Key? key, this.top = 12.0, this.bottom = 0}) : super(key: key);
  final double top;
  final double bottom;

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  String dropdownValue = 'Concesionario';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.top, bottom: widget.bottom),
      height: 50,
      child: DropdownButtonFormField(
        decoration: InputStyle.decoration(),
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(color: Colors.black, fontSize: 10),
        hint: const Text('Elegir concesionario'),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Concesionario', 'Two', 'Free', 'Four']
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

  const Input(
      {Key? key, required this.hintText, this.top = 12.0, this.bottom = 0})
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
      ),
    );
  }
}
