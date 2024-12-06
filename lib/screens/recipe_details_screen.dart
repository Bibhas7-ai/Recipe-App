import 'package:flutter/material.dart';
import 'package:food/services/json_map.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (recipe.image
                .isNotEmpty) // Shows image if available might be slow dummy read garda

              Image.network(
                recipe.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Cuisine: ${recipe.cuisine}'),
                  Text('Difficulty: ${recipe.difficulty}'),
                  Text(
                      'Rating: ${recipe.rating} (${recipe.reviewCount} reviews)'),
                  Text('Calories Per Serving: ${recipe.caloriesPerServing}'),
                  Text('Prep Time: ${recipe.prepTimeMinutes} minutes'),
                  Text('Cook Time: ${recipe.cookTimeMinutes} minutes'),
                  Text('Servings: ${recipe.servings}'),
                  const SizedBox(height: 16),
                  const Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.ingredients
                      .map((ingredient) => Text('- $ingredient')),
                  const SizedBox(height: 16),
                  const Text(
                    'Instructions:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ...recipe.instructions
                      .asMap()
                      .entries
                      .map((entry) => Text('${entry.key + 1}. ${entry.value}')),
                  const SizedBox(height: 16),
                  const Text(
                    'Tags:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: recipe.tags
                        .map((tag) => Chip(label: Text(tag.toString())))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Meal Type:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: recipe.mealType
                        .map((meal) => Chip(label: Text(meal.toString())))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
