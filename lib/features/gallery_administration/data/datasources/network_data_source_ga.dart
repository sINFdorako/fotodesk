import 'package:dio/dio.dart';
import 'package:fotodesk/core/network/dio_client.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/image.dart';

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

  Future<void> createCategory() async {
    try {
      final response = await _dio.get('/category/create');

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to create category');
      }
    } catch (error) {
      throw Exception('Failed to create category: $error');
    }
  }

  Future<Image> getImageByCategoryId(int categoryId) async {
    try {
      final response = await _dio.get('/image/uploads/$categoryId');

      if (response.statusCode == 200) {
        final dynamic rawData = response.data;
        final Image image = Image.fromJson(rawData);
        return image;
      } else {
        throw Exception('Failed to load image');
      }
    } catch (error) {
      throw Exception('Failed to load image: $error');
    }
  }

  Future<List<Image>> getAllImages() async {
    try {
      final response = await _dio.get('image/uploads');

      if (response.statusCode == 200) {
        final List<dynamic> rawData = response.data as List;
        final List<Image> images =
            rawData.map((imageData) => Image.fromJson(imageData)).toList();

        return images;
      } else {
        throw Exception('Failed to load images');
      }
    } catch (error) {
      throw Exception('Failed to load images: $error');
    }
  }

  Future<void> createImage(int categoryId) async {
    try {
      final response = await _dio.post('image/uploads/$categoryId');

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to create image');
      }
    } catch (error) {
      throw Exception('Failed to create image: $error');
    }
  }
}
