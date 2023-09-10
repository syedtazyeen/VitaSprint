import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:vitasprint/data/remote/models/recipe.dart';

class FirebaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  // Stream<List<Recipe>> getAllRecipes() {
  //   return _database.child('recipes').onValue.map((event) {
  //     final data = event.snapshot.value as Map<dynamic, dynamic>;
  //     final List<Recipe> recipes = [];
  //
  //     if (data != null) {
  //       data.forEach((key, value) {
  //         final recipe = value;
  //         recipes.add(recipe);
  //       });
  //     }
  //     return recipes;
  //   });
  // }

  // final DatabaseReference _databaseReference =
  // FirebaseDatabase.instance.ref('recipes');
  //
  // Future<List<Recipe>> fetchItems() async {
  //   DataSnapshot dataSnapshot = await _databaseReference.child('recipes').once();
  //
  //   List<Recipe> items = [];
  //
  //   if (dataSnapshot.value != null) {
  //     Map data = dataSnapshot.value as Map;
  //
  //     data.forEach((key, value) {
  //       items.add(Recipe(
  //         id: key,
  //         name: value['name'],
  //         quantity: value['quantity'],
  //       ));
  //     });
  //   }
  //
  //   return items;
  // }


}