import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/bmicalculatorwithcubit/BMIModel.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  BMIModel bmiModel = BMIModel.setBMI(150, 50, 20);
  static BmiCubit get(context) => BlocProvider.of(context);
  bool isFemale = true;
  bool isMale = false;

  void changeToFemaleGender() {
    isFemale = true;
    isMale = false;
    emit(ChangeGenderState());
  }

  void changeToMaleGender() {
    isFemale = false;
    isMale = true;
    emit(ChangeGenderState());
  }

  void changeHeight(value) {
    bmiModel.height = value;
    emit(ChangeHeightState());
  }

  void addWeight() {
    bmiModel.weight++;
    emit(ChangeWeightState());
  }

  void minusWeight() {
    bmiModel.weight--;
    emit(ChangeWeightState());
  }

  void addAge() {
    bmiModel.age++;
    emit(ChangeAgeState());
  }

  void minusAge() {
    bmiModel.age--;
    emit(ChangeAgeState());
  }
}
