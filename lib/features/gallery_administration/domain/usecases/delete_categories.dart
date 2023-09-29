import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';

import '../../../../core/errors/failures.dart';

class DeleteCategories {
  final GalleryAdminRepository repository;

  DeleteCategories(this.repository);

  Future<Either<Failure, void>> execute(List<int> categoryIds) async {
    return await repository.deleteCategories(categoryIds);
  }
}
