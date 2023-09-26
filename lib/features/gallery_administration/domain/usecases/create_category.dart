import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/category.dart';

class CreateCategory {
  final GalleryAdminRepository repository;

  CreateCategory(this.repository);

  Future<Either<Failure, void>> execute(Category category) async {
    return await repository.createCategory(category);
  }
}
