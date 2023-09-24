import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/image.dart';

class GetAllImages {
  final GalleryAdminRepository repository;

  GetAllImages(this.repository);

  Future<Either<Failure, List<Image>>> execute() async {
    return await repository.getAllImages();
  }
}
