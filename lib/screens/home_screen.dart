// import 'package:flutter/material.dart';
// import 'package:food/constants/constant_colors.dart';
// import 'package:food/provider/recipe_provider.dart';
// import 'package:food/screens/favorite_screen.dart';
// import 'package:food/screens/profile_screen.dart';
// import 'package:food/screens/recipe_details_screen.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   static const routeName = '/homeScreen';

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   String _searchQuery = "";

//   @override
//   void initState() {
//     super.initState();
//     // Fetch recipes when the screen is initialized
//     Future.microtask(() =>
//         Provider.of<RecipeProvider>(context, listen: false).fetchRecipes());
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     switch (index) {
//       case 0:
//         // Stay on Home Screen
//         break;
//       case 1:
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => FavoriteScreen()));
//         break;
//       case 2:
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => ProfileScreen()));
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final recipeProvider = Provider.of<RecipeProvider>(context);

//     // Filter recipes based on the search query
//     final filteredRecipes = recipeProvider.recipes
//         .where((recipe) =>
//             recipe.name.toLowerCase().contains(_searchQuery.toLowerCase()))
//         .toList();

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: ConstantColors.backgroundColor,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 50,
//                     height: 50,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const Row(
//                     children: [
//                       Icon(Icons.location_on),
//                       Text('Kathmandu, Nepal'),
//                     ],
//                   ),
//                   Container(
//                     width: 50,
//                     height: 50,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       blurRadius: 5,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   onChanged: (value) {
//                     setState(() {
//                       _searchQuery = value;
//                     });
//                   },
//                   decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.search, color: Colors.grey),
//                     hintText: 'Search Food by name',
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             // Expanded(
//             //   child: Container(
//             //     width: 295,
//             //     height: 10,
//             //     decoration: BoxDecoration(
//             //       gradient: const LinearGradient(colors: [
//             //         Color.fromARGB(255, 251, 213, 75),
//             //         Color.fromARGB(255, 228, 158, 7),
//             //       ]),
//             //       borderRadius: BorderRadius.circular(20),
//             //     ),
//             //     child: Column(
//             //       children: [
//             //         const Text(
//             //           'Find Your Food Recipe Easily',
//             //           style: TextStyle(
//             //               fontSize: 18,
//             //               fontWeight: FontWeight.bold,
//             //               color: Colors.white),
//             //         ),
//             //         const SizedBox(
//             //           height: 80,
//             //         ),
//             //         Padding(
//             //           padding: const EdgeInsets.all(10.0),
//             //           child: Row(
//             //             mainAxisAlignment: MainAxisAlignment.center,
//             //             children: [
//             //               Container(
//             //                 width: 100,
//             //                 height: 50,
//             //                 decoration: BoxDecoration(
//             //                   borderRadius: BorderRadius.circular(100),
//             //                   color: Colors.amber[800],
//             //                 ),
//             //                 child: const Center(
//             //                   child: Text(
//             //                     'Explore',
//             //                     style: TextStyle(
//             //                       color: Colors.white,
//             //                       fontWeight: FontWeight.bold,
//             //                     ),
//             //                   ),
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//             const SizedBox(
//               height: 20,
//             ),
//             const SizedBox(height: 10),
//             recipeProvider.isLoading
//                 ? const CircularProgressIndicator()
//                 : Expanded(
//                     child: filteredRecipes.isEmpty
//                         ? const Center(
//                             child: Text(
//                               'No recipes found.',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           )
//                         : GridView.builder(
//                             itemCount: filteredRecipes.length,
//                             itemBuilder: (context, index) {
//                               final recipe = filteredRecipes[index];
//                               return GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           RecipeDetailsScreen(recipe: recipe),
//                                     ),
//                                   );
//                                 },
//                                 child: Card(
//                                   elevation: 3,
//                                   child: Column(
//                                     children: [
//                                       recipe.image.isNotEmpty
//                                           ? Image.network(
//                                               recipe.image,
//                                               height: 70,
//                                               fit: BoxFit.cover,
//                                             )
//                                           : const Icon(Icons.fastfood,
//                                               size: 80),
//                                       Text(recipe.name,
//                                           style: const TextStyle(
//                                               fontWeight: FontWeight.bold)),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               crossAxisSpacing: 5,
//                               mainAxisSpacing: 5,
//                               childAspectRatio: 3 / 2,
//                             ),
//                           ),
//                   ),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               label: 'Favorites',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// updated codeimport 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:food/constants/constant_colors.dart';
import 'package:food/provider/recipe_provider.dart';
import 'package:food/screens/recipe_details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName1 = '/homeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<RecipeProvider>(context, listen: false).fetchRecipes());
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    final filteredRecipes = recipeProvider.recipes
        .where((recipe) =>
            recipe.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        backgroundColor: ConstantColors.backgroundColor,
        body: Column(
          children: [
            // Search Bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search Food by name',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            Expanded(
              child: recipeProvider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : filteredRecipes.isEmpty
                      ? const Center(
                          child: Text(
                            'No recipes found.',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            itemCount: filteredRecipes.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 3 / 4,
                            ),
                            itemBuilder: (context, index) {
                              final recipe = filteredRecipes[index];
                              return InkWell(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
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
                                              : const Icon(Icons.fastfood,
                                                  size: 80),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                recipe.name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                recipeProvider
                                                        .isFavorite(recipe)
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: recipeProvider
                                                        .isFavorite(recipe)
                                                    ? Colors.red
                                                    : Colors.grey,
                                              ),
                                              onPressed: () {
                                                recipeProvider
                                                    .toggleFavorite(recipe);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
