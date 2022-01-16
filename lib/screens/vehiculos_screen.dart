import 'package:bam/widgets/car_detail.dart';
import 'package:bam/widgets/slider_horizontal.dart';
import 'package:flutter/material.dart';

class VehiculosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Vehículos',
          style: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600),
          textAlign: TextAlign.left,
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 88,
            child: Expanded(
              child: ListView.builder(
                  //controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (_, int index) => SliderHorizontal()),
            ),
          ),
          Container(
            //width: 300,
            child: Expanded(
              child: ListView.builder(
                  //controller: scrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  itemBuilder: (_, int index) => CarDetail()),
            ),
          ),
        ],
      ),
    );
  }
}
