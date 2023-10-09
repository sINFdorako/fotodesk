import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/delete_categories.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/delete_images.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/update_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fotodesk/features/gallery_administration/domain/repositories/gallery_admin_repository.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/create_category.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/create_images.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/get_image_by_category_id.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/gallery_image.dart';
import '../../domain/usecases/get_all_categories.dart';

part 'gallery_admin_cubit.freezed.dart';
part 'gallery_admin_state.dart';

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
      (categoryList) => emit(state
          .copyWith(categoryList: categoryList, selectedCategoriesMarked: [])),
    );
  }

  Future<void> deleteCategory(List<int> categoryIds) async {
    DeleteCategories deleteCategories =
        DeleteCategories(galleryAdminRepository);
    await deleteCategories.execute(categoryIds);
    await getAllCategories();
  }

  Future<void> deleteImages(Category category, List<int> imageIds) async {
    DeleteImages deleteImages = DeleteImages(galleryAdminRepository);
    await deleteImages.execute(imageIds);
    await setCategoryAsClicked(category);
  }

  Future<void> createCategory(Category category) async {
    CreateCategory createCategory = CreateCategory(galleryAdminRepository);
    await createCategory.execute(category);
  }

  Future<void> updateCategory(Category category) async {
    UpdateCategory updateCategory = UpdateCategory(galleryAdminRepository);
    await updateCategory.execute(category.id!, category);
    getAllCategories();
  }

  Future<void> setCategoryAsClicked(Category category) async {
    final List<GalleryImage> images =
        await _getImagesByCategoryId(category.id!);

    unmarkAllCategories();

    // Update the selectedCategoryClicked with its respective images.
    final updatedCategory = category.copyWith(images: images);

    emit(state.copyWith(
        selectedCategoryClicked: updatedCategory, selectedImagesMarked: []));
  }

  Future<void> deSetCategoryAsClicked(Category category) async {
    emit(state.copyWith(selectedCategoryClicked: null));
  }

  Future<List<GalleryImage>> _getImagesByCategoryId(int categoryId) async {
    GetImageByCategoryId getImageByCategoryId =
        GetImageByCategoryId(galleryAdminRepository);
    final result = await getImageByCategoryId.execute(categoryId);

    return result.fold((failure) {
      return [];
    }, (images) {
      return images;
    });
  }

  Future<void> uploadImages(Category category, List<dynamic> imageFiles) async {
    CreateImages createImage = CreateImages(galleryAdminRepository);
    await createImage.execute(category.id!, imageFiles);

    await setCategoryAsClicked(category);
  }

  void markCategories(Category category) {
    final updatedList = List<Category>.from(state.selectedCategoriesMarked)
      ..add(category);
    emit(state.copyWith(selectedCategoriesMarked: updatedList));
  }

  void unmarkCategories(Category category) {
    final updatedList = List<Category>.from(state.selectedCategoriesMarked)
      ..remove(category);
    emit(state.copyWith(selectedCategoriesMarked: updatedList));
  }

  void unmarkAllCategories() {
    emit(state.copyWith(selectedCategoriesMarked: []));
  }

  void markImages(GalleryImage image) {
    final updatedList = List<GalleryImage>.from(state.selectedImagesMarked)
      ..add(image);
    emit(state.copyWith(selectedImagesMarked: updatedList));
  }

  void unmarkImages(GalleryImage image) {
    final updatedList = List<GalleryImage>.from(state.selectedImagesMarked)
      ..remove(image);
    emit(state.copyWith(selectedImagesMarked: updatedList));
  }

  void unmarkAllImages() {
    emit(state.copyWith(selectedImagesMarked: []));
  }
}
