part of 'gallery_admin_cubit.dart';

@freezed
class GalleryAdminState with _$GalleryAdminState {
  const factory GalleryAdminState(
      {required final List<Category> categoryList,
      required final List<GalleryImage> imageList,
      final Category? selectedCategoryMarked,
      final GalleryImage? selectedImageMarked,
      final Category? selectedCategoryClicked}) = _GalleryAdminState;

  factory GalleryAdminState.initial() {
    return const GalleryAdminState(
        categoryList: [],
        imageList: [],
        selectedCategoryClicked: null,
        selectedCategoryMarked: null);
  }
}
