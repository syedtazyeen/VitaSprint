part of 'steps_bloc.dart';

@immutable
abstract class StepsState {}

class StepsInitial extends StepsState {}

class StepsUpdatedState extends StepsState{
  final int currentSteps;
  final List<StepModel>? list;
  StepsUpdatedState(this.currentSteps, this.list);
}

class StepsEmptyState extends StepsState{
  final int currentSteps;
  final List<StepModel>? list;
  StepsEmptyState(this.currentSteps, this.list);
}