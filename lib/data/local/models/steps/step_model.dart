import 'package:hive/hive.dart';

part 'step_model.g.dart'; // Generated file

@HiveType(typeId: 0) // Unique ID for StepModel, should be different for each HiveType
class StepModel extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  int steps;

  @HiveField(2)
  double? calories;

  @HiveField(3)
  double? distance;

  @HiveField(4)
  double? time;

  StepModel(this.date, this.steps, this.calories, this.distance, this.time);
}
