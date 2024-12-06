import 'package:dio/dio.dart';

class UserServices {
  static const String base = 'https://dummyjson.com';
  final dio = Dio(BaseOptions(baseUrl: base));

  Future<Map<String, dynamic>> getUser() async {
    try {
      final response = await dio.get('/users/1');

      // Checking the response status code
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        final data = response.data;


        if (data is Map<String, dynamic>) {
          return data; 
        } else {
          throw Exception('Failed to fetch user: Unexpected data format');
        }
      } else {
        throw Exception('Failed to fetch user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching user: $e');
    }
  }
}
