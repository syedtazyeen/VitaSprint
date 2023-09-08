import 'package:hive/hive.dart';
import '../../../utils/steps_helper.dart';
import '../models/steps/step_model.dart';

class StepsRepository{

  static const String _boxName = 'steps';
  static const String _boxName2 = 'total_steps';

  Future<int> getTodayStepCount() async {
    final box = await Hive.openBox<StepModel>(_boxName);
    final success = await box.values
        .any((element) => element.date == getTodayDateWithoutTime());
    if (success) {
      StepModel existingStepModel = await box.values.firstWhere((element) =>
          element.date.isAtSameMomentAs(getTodayDateWithoutTime()));
      print("fetch: ${existingStepModel.steps}, cals - ${existingStepModel.calories} ");
      return existingStepModel.steps;
    } else {
      print("fetch: got nothing");
      return 0;
    }
  }


  Future<void> updateStepsForToday(int sensorInput) async{
    final box = await Hive.openBox<StepModel>(_boxName);
    final box2 = await Hive.openBox(_boxName2);

    final success = await box.values
        .any((element) => element.date == getTodayDateWithoutTime());

    if(success){
      StepModel existingStepModel = await box.values.firstWhere((element) =>
          element.date.isAtSameMomentAs(getTodayDateWithoutTime()));
      final int? sensorOld = await box2.get("sensor_old");
      existingStepModel.steps =  StepsHelper().calculateTodaySteps(sensorOld ?? 0, existingStepModel.steps, sensorInput);
      await existingStepModel.save();
      await box2.put("sensor_old", sensorInput);
      print("put: new count ${existingStepModel.steps}, sensor: $sensorInput,$sensorOld");
    }
    else{
      await box.add(StepModel(getTodayDateWithoutTime(), 0,0,0,0));
      print("put: got nothing");
    }
  }

  DateTime getTodayDateWithoutTime() {
    // Get the current date without time
    DateTime today = DateTime.now();
    DateTime todayWithoutTime = DateTime(today.year, today.month, today.day);
    return todayWithoutTime;
  }

}