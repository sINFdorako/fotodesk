import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/category.dart';
import '../entities/gallery_image.dart';

abstract class GalleryAdminRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, Category>> getCategoryById(int categoryId);
  Future<Either<Failure, void>> createCategory(Category category);
  Future<Either<Failure, List<GalleryImage>>> getImageByCategoryId(
      int categoryId);
  Future<Either<Failure, List<GalleryImage>>> getAllImages();
  Future<Either<Failure, void>> createImage(int categoryId, File imageFile);
}
