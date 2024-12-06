import 'package:dio/dio.dart';
import 'package:food/services/json_map.dart';

class DioServices {
  static const String base = 'https://dummyjson.com';
  final dio = Dio(BaseOptions(baseUrl: base));

  Future<List<Recipe>> getAllRecipes() async {
    try {
      final response = await dio.get('/recipes');

      // Check the response status code
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        final data = response.data;

        // Check if the response is a map and contains the 'recipes' key
        if (data is Map<String, dynamic> && data['recipes'] is List) {
          final recipesList = data['recipes'] as List;

          // Map the data to Recipe objects
          var newlist = recipesList
              .map((json) => Recipe.fromJson(json as Map<String, dynamic>))
              .toList();
          return newlist;
        } else {
          throw Exception('Failed to fetch recipes: Unexpected data format');
        }
      } else {
        throw Exception('Failed to fetch posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
}
