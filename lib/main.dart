import 'package:bam/bloc/concesionario_bloc.dart';
import 'package:bam/screens/cotizacion_screen.dart';
import 'package:bam/screens/cotizaciones_list.dart';
import 'package:bam/screens/detalle_screen.dart';
import 'package:bam/screens/vehiculos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white12,
      ),
    );
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ConcesionarioBloc())],
      child: MaterialApp(
        title: 'Concesionario',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light()
            .copyWith(appBarTheme: const AppBarTheme(color: Colors.white12)),
        initialRoute: 'vehiculos',
        routes: {
          'vehiculos': (_) => const VehiculosScreen(),
          'detalle': (_) => const DetalleScreen(),
          'cotizacion': (_) => const CotizacionScreen(),
          'cotizaciones': (_) => const CotizacionesList()
        },
      ),
    );
  }
}
