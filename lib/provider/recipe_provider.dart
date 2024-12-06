import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food/services/dio_services.dart';
import 'package:food/services/json_map.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> _recipes = [];
  final List<Recipe> favoriteRecipes = [];
  bool _isLoading = false;

  List<Recipe> get recipes => _recipes;
  bool get isLoading => _isLoading;

  bool isFavorite(Recipe recipe) {
    return favoriteRecipes.contains(recipe);
  }

  void toggleFavorite(Recipe recipe) {
    if (favoriteRecipes.contains(recipe)) {
      favoriteRecipes.remove(recipe);
    } else {
      favoriteRecipes.add(recipe);
    }
    notifyListeners(); // Notify listeners after change
  }

  Future<void> fetchRecipes() async {
    if (_recipes.isNotEmpty) return; // Don't fetch again if already fetched

    _isLoading = true;
    notifyListeners(); // Notify listeners that loading has started

    try {
      final fetchedRecipes = await DioServices().getAllRecipes();
      _recipes = fetchedRecipes;
    } catch (e) {
      debugPrint('Error fetching recipes: $e');
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners after loading is finished
    }
  }
}
