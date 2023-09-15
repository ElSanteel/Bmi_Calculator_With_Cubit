part of 'bmi_cubit.dart';

@immutable
abstract class BmiState {}

class BmiInitial extends BmiState {}

class ChangeGenderState extends BmiState {}

class ChangeHeightState extends BmiState {}

class ChangeWeightState extends BmiState {}

class ChangeAgeState extends BmiState {}
