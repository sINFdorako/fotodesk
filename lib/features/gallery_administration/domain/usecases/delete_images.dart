import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';

import '../../../../core/errors/failures.dart';

class DeleteImages {
  final GalleryAdminRepository repository;

  DeleteImages(this.repository);

  Future<Either<Failure, void>> execute(List<int> imageIds) async {
    return await repository.deleteImages(imageIds);
  }
}
