import 'package:firebase_database/firebase_database.dart';

import '../models/recipe.dart';

class RecipeRepository {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref("recipes").ref;

  Future<List<Recipe>> fetchItems() async {
    List<Recipe> items = [];
    final fd = await FirebaseDatabase.instance.ref('recipes').get();

    //var map = fd.value as Map;

    fd.children.forEach((element) {
      print(element.value);
      items.add(Recipe.fromJson(element.value));
      print(Recipe.fromJson(element.value));
    });

    return items;
  }
}
