import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/category.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';

import '../../../../core/errors/failures.dart';

class UpdateCategory {
  final GalleryAdminRepository repository;

  UpdateCategory(this.repository);

  Future<Either<Failure, void>> execute(
      int categoryId, Category category) async {
    return await repository.updateCategory(categoryId, category);
  }
}
