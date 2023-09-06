import 'dart:async';
import 'package:pedometer/pedometer.dart';

import '../blocs/steps/steps_bloc.dart';

class StepCounter {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = "?";

  StepsBloc stepBloc;

  StepCounter({required this.stepBloc}){
    initPlatformState();
  }


  void onStepCount(StepCount event) {
    _steps = event.steps.toString();
    print("sensor reading : $_steps");
    // Dispatch the UpdateStepCount event to the StepBloc.
    stepBloc.add(StepUpdateEvent(int.parse(_steps)));
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    _status = event.status;
    //onStepStatusChanged(_status.contains("stopped") ? false : true);
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    _status = 'Pedestrian Status not available';
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    _steps = 'null';
    print(_steps);
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream.listen(onPedestrianStatusChanged).onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }
}
