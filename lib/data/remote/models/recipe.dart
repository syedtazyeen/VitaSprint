class Recipe {
  final String name;
  final String description;
  final List<String>? ingredients;
  final List<String>? instructions;
  final String? calories;
  final Map<String, String>? nutrients;
  final String? cookingTime;
  final String? servings;

  Recipe({
    required this.name,
    required this.description,
    this.ingredients,
    this.instructions,
    this.calories,
    this.nutrients,
    this.cookingTime,
    this.servings,
  });



  factory Recipe.fromJson(dynamic json) {
    return Recipe(name: json['name'].toString(), description: json["description"].toString(),calories: json['cooking_time'].toString());
  }


}
