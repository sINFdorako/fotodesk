import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';

import '../../../../core/errors/failures.dart';

class CreateImage {
  final GalleryAdminRepository repository;

  CreateImage(this.repository);

  Future<Either<Failure, void>> execute(int categoryId) async {
    return await repository.createImage(categoryId);
  }
}
