import 'package:bam/screens/vehiculos_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const VehiculosScreen(),
  };
}
