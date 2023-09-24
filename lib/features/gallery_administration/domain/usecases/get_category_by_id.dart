// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';

import '../entities/category.dart';

class GetCategoryById {
  final GalleryAdminRepository repository;

  GetCategoryById(this.repository);

  Future<Either<Failure, Category>> execute(int categoryId) {
    return repository.getCategoryById(categoryId);
  }
}
