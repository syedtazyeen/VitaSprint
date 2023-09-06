part of 'steps_bloc.dart';

@immutable
abstract class StepsState {}

class StepsInitial extends StepsState {}

class StepsUpdatedState extends StepsState{
  final int currentSteps;
  StepsUpdatedState(this.currentSteps);
}