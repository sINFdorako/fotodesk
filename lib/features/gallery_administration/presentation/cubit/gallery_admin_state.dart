part of 'gallery_admin_cubit.dart';

@freezed
class GalleryAdminState with _$GalleryAdminState {
  const factory GalleryAdminState(
      {required final List<Category> categoryList,
      required final List<GalleryImage> imageList,
      required final List<Category> selectedCategoriesMarked,
      required final List<GalleryImage> selectedImagesMarked,
      required bool isLoading,
      final Category? selectedCategoryClicked}) = _GalleryAdminState;

  factory GalleryAdminState.initial() {
    return const GalleryAdminState(
      selectedImagesMarked: [],
      selectedCategoriesMarked: [],
      categoryList: [],
      imageList: [],
      selectedCategoryClicked: null,
      isLoading: false,
    );
  }
}
