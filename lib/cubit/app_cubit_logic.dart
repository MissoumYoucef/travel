import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit_state.dart';
import 'package:travelapp/cubit/app_cubits.dart';
import 'package:travelapp/pages/detailed_page.dart';
import 'package:travelapp/pages/navpages/home_page.dart';

import '../pages/welcome_page.dart';

class AppCubitsLogic extends StatefulWidget {
  const AppCubitsLogic({super.key});

  @override
  State<AppCubitsLogic> createState() => _AppCubitsLogicState();
}

class _AppCubitsLogicState extends State<AppCubitsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitState>(
      builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        }
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedState) {
          return const HomePage();
        }
        if (state is PlaceState) {
          return const DetailPage();
        }
        return Container();
      },
    ));
  }
}
