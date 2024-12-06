import 'package:flutter/material.dart';
import 'package:food/provider/recipe_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List _filteredRecipes = [];

  @override
  void initState() {
    super.initState();
    // Initializing tht filterred recipe initially
    _filteredRecipes =
        Provider.of<RecipeProvider>(context, listen: false).recipes;

    // Setting up listener for the search bar input
    _searchController.addListener(_filterRecipes);
  }

  void _filterRecipes() {
    final query = _searchController.text.toLowerCase();
    final allRecipes =
        Provider.of<RecipeProvider>(context, listen: false).recipes;

    // Filtered recipes based on search 
    setState(() {
      _filteredRecipes = allRecipes.where((recipe) {
        return recipe.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipes'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const Icon(Icons.search),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search Food by name',
                    ),
                  ),
                ),
              ],
            ),
          ),
          recipeProvider.isLoading
              ? const CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                    itemCount: _filteredRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = _filteredRecipes[index];
                      return ListTile(
                        title: Text(recipe.name),
                        subtitle: Text('Cuisine: ${recipe.cuisine}'),
                        onTap: () {
                          // Navigate to recipe details screen
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
