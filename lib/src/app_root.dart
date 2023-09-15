import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bmi_cubit/bmi_cubit.dart';
import '../screens/Session_5_Flutter_Task/bmi_calculator_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (BuildContext context) => BmiCubit())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BmiCalculatorScreen(),
      ),
    );
  }
}
