import 'package:flutter/material.dart';

class CarDetail extends StatelessWidget {
  const CarDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'detalle'),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: AssetImage('assets/ghibli.png'),
            height: 260,
            width: 260,
          ),
        ),
        Container(
          width: 375,
          child: const Text(
            'Ghibli',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          width: 375,
          child: const Text(
            'With designer looks and twin-turbo power, the 2022 Maserati Ghibli brings a ton of Italian attitude to the mid-size luxury sedan party.',
            style: TextStyle(
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
