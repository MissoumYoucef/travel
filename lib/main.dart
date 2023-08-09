import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/app_cubit_logic.dart';
import 'cubit/app_cubits.dart';
import 'services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),

      // BlocProvider

      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(DataServices()),
        child: const AppCubitsLogic(),
      ),
    );
  }
}











//onGenerateTitle: (context) => "My App",
// initialRoute: RouteGenerator.homePage,
// onGenerateRoute: RouteGenerator.generateRoute,

