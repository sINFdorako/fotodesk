import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/image.dart';

class GetImageByCategoryId {
  final GalleryAdminRepository repository;

  GetImageByCategoryId(this.repository);

  Future<Either<Failure, Image>> execute(int categoryId) async {
    return await repository.getImageByCategoryId(categoryId);
  }
}
