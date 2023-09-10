import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vitasprint/data/remote/models/recipe.dart';
import 'package:vitasprint/data/remote/repositories/recipe_repository.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

// class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
//   RecipeBloc() : super(RecipeInitial()) {
//     on<RecipeEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }


class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository repository;

  //RecipeBloc(this.repository) : super(RecipeInitial());

  void appLaunch(){
    add(FetchDataEvent());
  }

  RecipeBloc(this.repository) : super(RecipeInitial()) {
    on<RecipeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FetchDataEvent>(recipeFetchEvent);

  }


  // @override
  // Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
  //   if (event is FetchDataEvent) {
  //     yield RecipeLoading();
  //     try {
  //       final data = await repository.fetchItems();
  //       yield RecipeLoaded(data);
  //     } catch (e) {
  //       yield RecipeError(e.toString());
  //     }
  //   }
  // }


  FutureOr<void> recipeFetchEvent(FetchDataEvent event, Emitter<RecipeState> emit) async{
    emit(RecipeLoading());
    try{
      final data = await repository.fetchItems();
      emit(RecipeLoaded(data));
    } catch (e){
      emit(RecipeError("error: $e"));
    }
  }
}