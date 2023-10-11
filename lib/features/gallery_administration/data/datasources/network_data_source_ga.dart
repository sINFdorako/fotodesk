import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fotodesk/core/network/dio_client.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/file_pick_info.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/gallery_image.dart';
import 'package:http_parser/http_parser.dart';

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

  Future<void> createCategory(Category category) async {
    try {
      final response =
          await _dio.post('/category/create', data: category.toJson());

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to create category');
      }
    } catch (error) {
      throw Exception('Failed to create category: $error');
    }
  }

  Future<List<GalleryImage>> getImageByCategoryId(int categoryId) async {
    try {
      final response = await _dio.get('/image/uploads/$categoryId');
      if (response.statusCode == 200) {
        final List<dynamic> rawData = response.data as List;
        final List<GalleryImage> images = rawData
            .map((imageData) => GalleryImage.fromJson(imageData))
            .toList();
        return images;
      } else {
        throw Exception('Failed to load image');
      }
    } catch (error) {
      throw Exception('Failed to load image: $error');
    }
  }

  Future<List<GalleryImage>> getAllImages() async {
    try {
      final response = await _dio.get('/image/uploads');

      if (response.statusCode == 200) {
        final List<dynamic> rawData = response.data as List;
        final List<GalleryImage> images = rawData
            .map((imageData) => GalleryImage.fromJson(imageData))
            .toList();

        return images;
      } else {
        throw Exception('Failed to load images');
      }
    } catch (error) {
      throw Exception('Failed to load images: $error');
    }
  }

  Future<void> createImages(
      int categoryId, List<FilePickInfo> imageFiles) async {
    try {
      List<MultipartFile> multiPartFiles = [];

      bool isDesktopPlatform = false;
      try {
        isDesktopPlatform =
            Platform.isMacOS || Platform.isWindows || Platform.isLinux;
      } catch (e) {}

      for (final fileInfo in imageFiles) {
        MultipartFile multipartFile;

        if (isDesktopPlatform) {
          if (fileInfo.file == null) {
            throw Exception('File object is null for desktop upload');
          }
          multipartFile = await MultipartFile.fromFile(fileInfo.file!.path,
              filename: fileInfo.name);
        } else {
          // Other platforms (mobile or web)
          if (fileInfo.bytes == null || fileInfo.name == null) {
            throw Exception(
                'File bytes or name is null for non-desktop upload');
          }
          List<String> type = fileInfo.mimeType!.split('/');
          multipartFile = MultipartFile.fromBytes(fileInfo.bytes!,
              filename: fileInfo.name,
              contentType: MediaType(type[0], type[1]));
        }

        multiPartFiles.add(multipartFile);
      }

      FormData formData = FormData.fromMap({
        "images[]": multiPartFiles,
      });

      final response =
          await _dio.post('/image/uploads/$categoryId', data: formData);

      if (response.statusCode == 200) {
        // Do something on success if needed
      } else {
        throw Exception('Failed to create image');
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to create image: $error');
    }
  }

  Future<void> updateCategory(Category category, int categoryId) async {
    try {
      final response =
          await _dio.put('/category/$categoryId', data: category.toJson());
      if (response.statusCode != 200) {
        throw Exception('Failed to update category');
      }
    } catch (error) {
      throw Exception('Failed to update category: $error');
    }
  }

  Future<void> deleteImages(List<int> imageIds) async {
    try {
      final response = await _dio.delete('/image', data: {
        "imageIds": imageIds,
      });
      if (response.statusCode != 204) {
        // Assuming 204 No Content is the expected success response code for deletions
        throw Exception('Failed to delete images');
      }
    } catch (error) {
      throw Exception('Failed to delete images: $error');
    }
  }

  Future<void> deleteCategories(List<int> categoryIds) async {
    try {
      final response = await _dio.delete('/category', data: {
        "categoryIds": categoryIds,
      });
      if (response.statusCode != 204) {
        // Assuming 204 No Content is the expected success response code for deletions
        throw Exception('Failed to delete categories');
      }
    } catch (error) {
      throw Exception('Failed to delete categories: $error');
    }
  }
}
