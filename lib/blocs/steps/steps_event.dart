part of 'steps_bloc.dart';

@immutable
abstract class StepsEvent {}


class StepUpdateEvent extends StepsEvent {
  final int stepCount;
  StepUpdateEvent(this.stepCount);
}

class StepCountPushInHive extends StepsEvent{
  final int stepCount;
  StepCountPushInHive(this.stepCount);
}

class StepCountBankFetchFromHive extends StepsEvent{}

class StepCountFetchFromHive extends StepsEvent{}