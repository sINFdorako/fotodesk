import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';

import '../../../../core/errors/failures.dart';

class CreateImages {
  final GalleryAdminRepository repository;

  CreateImages(this.repository);

  Future<Either<Failure, void>> execute(
      int categoryId, List<dynamic> imageFiles) async {
    return await repository.createImages(categoryId, imageFiles);
  }
}
