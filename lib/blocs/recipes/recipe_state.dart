part of 'recipe_bloc.dart';

@immutable
abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<Recipe> data;
  RecipeLoaded(this.data);
}

class RecipeError extends RecipeState {
  final String error;
  RecipeError(this.error);
}