import 'package:flutter/material.dart';
import 'package:food/constants/constant_colors.dart';
import 'package:food/provider/recipe_provider.dart';
import 'package:food/screens/recipe_details_screen.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static const routeName = '/favoriteScreen';

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    final favoriteRecipes = recipeProvider.favoriteRecipes;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ConstantColors.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Favorites"),
          centerTitle: true,
        ),
        body: favoriteRecipes.isEmpty
            ? const Center(
                child: Text(
                  'No favorite recipes added yet!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: favoriteRecipes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  final recipe = favoriteRecipes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailsScreen(recipe: recipe),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: recipe.image.isNotEmpty
                                  ? Image.network(
                                      recipe.image,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(Icons.fastfood, size: 80),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              recipe.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
