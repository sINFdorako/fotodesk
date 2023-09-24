import 'package:dartz/dartz.dart';
import 'package:fotodesk/core/errors/failures.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/category.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';

class GetAllCategories {
  final GalleryAdminRepository repository;

  GetAllCategories(this.repository);

  Future<Either<Failure, List<Category>>> execute() async {
    return await repository.getAllCategories();
  }
}
