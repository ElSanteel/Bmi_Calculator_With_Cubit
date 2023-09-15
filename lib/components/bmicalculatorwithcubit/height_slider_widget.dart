import 'package:bmicalculatorwithcubit/bloc/bmi_cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightSliderWidget extends StatelessWidget {
  const HeightSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiCubit, BmiState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BmiCubit.get(context);

        return Slider(
          min: 100.0,
          max: 200.0,
          divisions: 100,
          value: cubit.bmiModel.height,
          activeColor: const Color(0xff6200EE),
          inactiveColor: const Color(0xff979797),
          thumbColor: const Color(0xffF10606),
          label: cubit.bmiModel.height.round().toString(),
          onChanged: cubit.changeHeight,
        );
      },
    );
  }
}
