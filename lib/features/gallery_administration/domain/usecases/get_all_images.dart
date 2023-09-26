import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/gallery_image.dart';

class GetAllImages {
  final GalleryAdminRepository repository;

  GetAllImages(this.repository);

  Future<Either<Failure, List<GalleryImage>>> execute() async {
    return await repository.getAllImages();
  }
}
