class Recipe {
  final int id;
  final String name;
  final List ingredients;
  final List instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List tags;
  final int userId;
  final String image;
  final String rating;
  final int reviewCount;
  final List mealType;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      ingredients: json['ingredients'],
      instructions: json['instructions'],
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      cuisine: json['cuisine'],
      caloriesPerServing: json['caloriesPerServing'],
      tags: json['tags'],
      userId: json['userId'],
      image: json['image'],
      rating: json['rating'].toString(),
      reviewCount: json['reviewCount'],
      mealType: json['mealType'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'ingredients': ingredients,
        'instructions': instructions,
        'prepTimeMinutes': prepTimeMinutes,
        'cookTimeMinutes': cookTimeMinutes,
        'servings': servings,
        'difficulty': difficulty,
        'cuisine': cuisine,
        'caloriesPerServing': caloriesPerServing,
        'tags': tags,
        'userId': userId,
        'image': image,
        'rating': rating,
        'reviewCount': reviewCount,
        'mealType': mealType
      };
}
