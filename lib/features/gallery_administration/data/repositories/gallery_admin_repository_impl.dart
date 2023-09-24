import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/image.dart';
import '../../domain/repositories/gallery_admin_repository.dart';
import '../datasources/network_data_source_ga.dart';

class GalleryAdminRepositoryImpl implements GalleryAdminRepository {
  final NetworkDataSourceGA networkDataSourceGA;

  GalleryAdminRepositoryImpl(this.networkDataSourceGA);

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
    try {
      final List<Category> categories =
          await networkDataSourceGA.getAllCategories();
      return Right(categories);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Category>> getCategoryById(int categoryId) async {
    try {
      final Category category =
          await networkDataSourceGA.getCategoryById(categoryId);
      return Right(category);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> createCategory() async {
    try {
      await networkDataSourceGA.createCategory();
      return const Right(unit);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Image>>> getAllImages() async {
    try {
      final List<Image> images = await networkDataSourceGA.getAllImages();
      return Right(images);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Image>> getImageByCategoryId(int categoryId) async {
    try {
      final Image image =
          await networkDataSourceGA.getImageByCategoryId(categoryId);
      return Right(image);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> createImage(int categoryId) async {
    try {
      await networkDataSourceGA.createImage(categoryId);
      return const Right(unit);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
