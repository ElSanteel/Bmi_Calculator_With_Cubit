import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bmi_cubit/bmi_cubit.dart';
import '../../components/bmicalculatorwithcubit/gender_widget.dart';
import '../../components/bmicalculatorwithcubit/height_slider_widget.dart';
import '../../core/size_config.dart';
import 'bmi_calculator_result.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xff0b0e22),
      appBar: AppBar(
        backgroundColor: const Color(0xff1A1F38),
        title: const Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocConsumer<BmiCubit, BmiState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = BmiCubit.get(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      cubit.changeToFemaleGender();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff1A1F38),
                        border: Border.all(
                          color: cubit.isFemale
                              ? Colors.white
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      child: genderWidget(
                          imagePath: 'assets/images/female_vector.png',
                          gender: 'FEMALE',
                          selected: cubit.isFemale),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.changeToMaleGender();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff1A1F38),
                        border: Border.all(
                          color:
                              cubit.isMale ? Colors.white : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      child: genderWidget(
                        imagePath: "assets/images/male_vector.png",
                        gender: "MALE",
                        selected: cubit.isMale,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: SizeConfig.screenWidth! * 0.75,
                decoration: BoxDecoration(
                    color: const Color(0xff1A1F38),
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "HEIGHT",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "CM",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(height: 35),
                      HeightSliderWidget()
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff1A1F38),
                        borderRadius: BorderRadius.circular(15)),
                    height: SizeConfig.screenHeight! * 0.20,
                    width: SizeConfig.screenWidth! * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text("${cubit.bmiModel.weight}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Material(
                              type: MaterialType.transparency,
                              child: Ink(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40.0)),
                                child: InkWell(
                                  onTap: () {
                                    cubit.minusWeight();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.minimize,
                                      size: 30,
                                      color: Color(0xff1A1F38),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              type: MaterialType.transparency,
                              child: Ink(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40.0)),
                                child: InkWell(
                                  onTap: () {
                                    cubit.addWeight();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Color(0xff1A1F38),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: SizeConfig.screenHeight! * 0.20,
                    width: SizeConfig.screenWidth! * 0.35,
                    decoration: BoxDecoration(
                        color: const Color(0xff1A1F38),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "AGE",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text("${cubit.bmiModel.age}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Material(
                              type: MaterialType.transparency,
                              child: Ink(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40.0)),
                                child: InkWell(
                                  onTap: () {
                                    cubit.minusAge();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.minimize,
                                      size: 30,
                                      color: Color(0xff1A1F38),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              type: MaterialType.transparency,
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    cubit.addAge();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Color(0xff1A1F38),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffF10606),
                    fixedSize: const Size(405, 84),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                onPressed: () {
                  cubit.bmiModel.calculateBMI();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                bmiModel: cubit.bmiModel,
                              )));
                },
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(fontSize: 24),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
