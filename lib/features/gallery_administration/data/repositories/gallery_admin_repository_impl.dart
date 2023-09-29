import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/gallery_image.dart';
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
  Future<Either<Failure, void>> createCategory(Category category) async {
    try {
      await networkDataSourceGA.createCategory(category);
      return const Right(unit);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<GalleryImage>>> getAllImages() async {
    try {
      final List<GalleryImage> images =
          await networkDataSourceGA.getAllImages();
      return Right(images);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<GalleryImage>>> getImageByCategoryId(
      int categoryId) async {
    try {
      final List<GalleryImage> images =
          await networkDataSourceGA.getImageByCategoryId(categoryId);
      return Right(images);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> createImages(
      int categoryId, List<File> imageFile) async {
    try {
      await networkDataSourceGA.createImages(categoryId, imageFile);
      return const Right(unit);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategories(List<int> categoryIds) async {
    try {
      await networkDataSourceGA.deleteCategories(categoryIds);
      return const Right(unit);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteImages(List<int> imageIds) async {
    try {
      await networkDataSourceGA.deleteImages(imageIds);
      return const Right(unit);
    } catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory(
      int categoryId, Category newCategoryDetails) async {
    try {
      // Assuming the data source has a method that accepts an updated category object
      await networkDataSourceGA.updateCategory(newCategoryDetails, categoryId);
      return const Right(unit);
    } catch (error) {
      return Left(ServerFailure());
    }
  }
}
