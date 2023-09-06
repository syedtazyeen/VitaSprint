import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'steps_event.dart';
part 'steps_state.dart';

class StepsBloc extends Bloc<StepsEvent, StepsState> {
  StepsBloc() : super(StepsInitial()) {
    on<StepsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<StepUpdateEvent>(stepsUpdateEventMethod);

  }

  FutureOr<void> stepsUpdateEventMethod(
      StepUpdateEvent event, Emitter<StepsState> emit) {
    print("event triggered: ${event.runtimeType} - not emitted");
    emit(StepsUpdatedState(event.stepCount));
  }
}
