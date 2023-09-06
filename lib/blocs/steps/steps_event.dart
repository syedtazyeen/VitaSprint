part of 'steps_bloc.dart';

@immutable
abstract class StepsEvent {}


class StepUpdateEvent extends StepsEvent {
  final int stepCount;
  StepUpdateEvent(this.stepCount);
}