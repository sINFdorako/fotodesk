import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/category.dart';
import '../entities/image.dart';

abstract class GalleryAdminRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, Category>> getCategoryById(int categoryId);
  Future<Either<Failure, void>> createCategory();
  Future<Either<Failure, Image>> getImageByCategoryId(int categoryId);
  Future<Either<Failure, List<Image>>> getAllImages();
  Future<Either<Failure, void>> createImage(int categoryId);
}
