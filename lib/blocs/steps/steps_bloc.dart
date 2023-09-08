import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:vita_sprint/data/local/repositories/steps_repository.dart';
import '../../data/local/models/steps/step_model.dart';
import '';

part 'steps_event.dart';
part 'steps_state.dart';

class StepsBloc extends Bloc<StepsEvent, StepsState> {
  StepsBloc() : super(StepsInitial()) {
    on<StepsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<StepUpdateEvent>(stepsUpdateEvent);
    on<StepCountPushInHive>(stepCountPushInHive);
    on<StepCountFetchFromHive>(stepCountFetchFromHive);

  }


  //Event methods
  FutureOr<void> stepsUpdateEvent(
      StepUpdateEvent event, Emitter<StepsState> emit) {
    print("event triggered: ${event.runtimeType} - not emitted");
    add(StepCountPushInHive(event.stepCount));
  }

  FutureOr<void> stepCountPushInHive(StepCountPushInHive event, Emitter<StepsState> emit) {
    print("event triggered: ${event.runtimeType}");
    StepsRepository().updateStepsForToday(event.stepCount);
    add(StepCountFetchFromHive());
    add(StepCountBankFetchFromHive());
  }

  Future<FutureOr<void>> stepCountFetchFromHive(StepCountFetchFromHive event, Emitter<StepsState> emit) async {
    print("event triggered: ${event.runtimeType}");
    emit(StepsUpdatedState(await StepsRepository().getTodayStepCount(),await stepCountBankFetchFromHive()));
  }

  Future<List<StepModel>> stepCountBankFetchFromHive() async{
    final box = await Hive.openBox<StepModel>('steps');

    DateTime now = StepsRepository().getTodayDateWithoutTime();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday));
    DateTime endOfWeek = now.add(Duration(days: now.weekday + 6));

    // Fetch data within the current week
    List<StepModel> results = box.values.where((value) {
      return value.date.isAfter(startOfWeek) && value.date.isBefore(endOfWeek);
    }).toList();

    if (results.isEmpty) print("not found...$startOfWeek, $endOfWeek");
    for (var item in results) {
      print("${item.date}- ${item.steps}...$startOfWeek, $endOfWeek");
    }

    return results;
  }



}