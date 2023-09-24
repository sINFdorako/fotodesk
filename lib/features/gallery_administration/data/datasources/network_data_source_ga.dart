import 'package:dio/dio.dart';
import 'package:fotodesk/core/network/dio_client.dart';
import '../../domain/entities/category.dart';

class NetworkDataSourceGA {
  final Dio _dio = DioClient().fotoDeskApi;

  Future<List<Category>> getAllCategories() async {
    try {
      final response = await _dio.get('/category');

      if (response.statusCode == 200) {
        final List<dynamic> rawData = response.data as List;
        final List<Category> categories = rawData
            .map((categoryData) => Category.fromJson(categoryData))
            .toList();

        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (error) {
      throw Exception('Failed to get categories: $error');
    }
  }

  Future<Category> getCategoryById(int categoryId) async {
    try {
      final response = await _dio.get('/category/$categoryId');

      if (response.statusCode == 200) {
        final dynamic rawData = response.data;
        final Category category = Category.fromJson(rawData);
        return category;
      } else {
        throw Exception('Failed to load category');
      }
    } catch (error) {
      throw Exception('Failed to load category: $error');
    }
  }
}
