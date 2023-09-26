import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/create_category.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/get_image_by_category_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/gallery_image.dart';
import '../../domain/usecases/get_all_categories.dart';

part 'gallery_admin_state.dart';
part 'gallery_admin_cubit.freezed.dart';

class GalleryAdminCubit extends Cubit<GalleryAdminState> {
  final GalleryAdminRepository galleryAdminRepository;
  GalleryAdminCubit(this.galleryAdminRepository)
      : super(GalleryAdminState.initial());

  Future<void> getAllCategories() async {
    GetAllCategories getAllCategories =
        GetAllCategories(galleryAdminRepository);
    final Either<Failure, List<Category>> result =
        await getAllCategories.execute();
    result.fold(
      (failure) {},
      (categoryList) => emit(state.copyWith(categoryList: categoryList)),
    );
  }

  Future<void> createCategory(Category category) async {
    CreateCategory createCategory = CreateCategory(galleryAdminRepository);
    await createCategory.execute(category);
  }

  Future<void> setCategoryAsClicked(Category category) async {
    final List<GalleryImage> images = await _getImageByCategoryId(category.id!);

    // Update the selectedCategoryClicked with its respective images.
    final updatedCategory = category.copyWith(images: images);

    emit(state.copyWith(selectedCategoryClicked: updatedCategory));
  }

  Future<void> deSetCategoryAsClicked(Category category) async {
    emit(state.copyWith(selectedCategoryClicked: null));
  }

  Future<List<GalleryImage>> _getImageByCategoryId(int categoryId) async {
    GetImageByCategoryId getImageByCategoryId =
        GetImageByCategoryId(galleryAdminRepository);
    final result = await getImageByCategoryId.execute(categoryId);

    return result.fold((failure) {
      throw Exception('Failed to get images: $failure');
    }, (images) {
      return images;
    });
  }

  void markCategory(Category category) {
    emit(state.copyWith(selectedCategoryMarked: category));
  }

  void unmarkCategory() {
    emit(state.copyWith(selectedCategoryMarked: null));
  }
}
