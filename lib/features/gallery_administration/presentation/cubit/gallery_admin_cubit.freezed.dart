// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_admin_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GalleryAdminState {
  List<Category> get categoryList => throw _privateConstructorUsedError;
  List<GalleryImage> get imageList => throw _privateConstructorUsedError;
  List<Category> get selectedCategoriesMarked =>
      throw _privateConstructorUsedError;
  List<GalleryImage> get selectedImagesMarked =>
      throw _privateConstructorUsedError;
  Category? get selectedCategoryClicked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryAdminStateCopyWith<GalleryAdminState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryAdminStateCopyWith<$Res> {
  factory $GalleryAdminStateCopyWith(
          GalleryAdminState value, $Res Function(GalleryAdminState) then) =
      _$GalleryAdminStateCopyWithImpl<$Res, GalleryAdminState>;
  @useResult
  $Res call(
      {List<Category> categoryList,
      List<GalleryImage> imageList,
      List<Category> selectedCategoriesMarked,
      List<GalleryImage> selectedImagesMarked,
      Category? selectedCategoryClicked});

  $CategoryCopyWith<$Res>? get selectedCategoryClicked;
}

/// @nodoc
class _$GalleryAdminStateCopyWithImpl<$Res, $Val extends GalleryAdminState>
    implements $GalleryAdminStateCopyWith<$Res> {
  _$GalleryAdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryList = null,
    Object? imageList = null,
    Object? selectedCategoriesMarked = null,
    Object? selectedImagesMarked = null,
    Object? selectedCategoryClicked = freezed,
  }) {
    return _then(_value.copyWith(
      categoryList: null == categoryList
          ? _value.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      imageList: null == imageList
          ? _value.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<GalleryImage>,
      selectedCategoriesMarked: null == selectedCategoriesMarked
          ? _value.selectedCategoriesMarked
          : selectedCategoriesMarked // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      selectedImagesMarked: null == selectedImagesMarked
          ? _value.selectedImagesMarked
          : selectedImagesMarked // ignore: cast_nullable_to_non_nullable
              as List<GalleryImage>,
      selectedCategoryClicked: freezed == selectedCategoryClicked
          ? _value.selectedCategoryClicked
          : selectedCategoryClicked // ignore: cast_nullable_to_non_nullable
              as Category?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get selectedCategoryClicked {
    if (_value.selectedCategoryClicked == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.selectedCategoryClicked!, (value) {
      return _then(_value.copyWith(selectedCategoryClicked: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GalleryAdminStateCopyWith<$Res>
    implements $GalleryAdminStateCopyWith<$Res> {
  factory _$$_GalleryAdminStateCopyWith(_$_GalleryAdminState value,
          $Res Function(_$_GalleryAdminState) then) =
      __$$_GalleryAdminStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Category> categoryList,
      List<GalleryImage> imageList,
      List<Category> selectedCategoriesMarked,
      List<GalleryImage> selectedImagesMarked,
      Category? selectedCategoryClicked});

  @override
  $CategoryCopyWith<$Res>? get selectedCategoryClicked;
}

/// @nodoc
class __$$_GalleryAdminStateCopyWithImpl<$Res>
    extends _$GalleryAdminStateCopyWithImpl<$Res, _$_GalleryAdminState>
    implements _$$_GalleryAdminStateCopyWith<$Res> {
  __$$_GalleryAdminStateCopyWithImpl(
      _$_GalleryAdminState _value, $Res Function(_$_GalleryAdminState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryList = null,
    Object? imageList = null,
    Object? selectedCategoriesMarked = null,
    Object? selectedImagesMarked = null,
    Object? selectedCategoryClicked = freezed,
  }) {
    return _then(_$_GalleryAdminState(
      categoryList: null == categoryList
          ? _value._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      imageList: null == imageList
          ? _value._imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<GalleryImage>,
      selectedCategoriesMarked: null == selectedCategoriesMarked
          ? _value._selectedCategoriesMarked
          : selectedCategoriesMarked // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      selectedImagesMarked: null == selectedImagesMarked
          ? _value._selectedImagesMarked
          : selectedImagesMarked // ignore: cast_nullable_to_non_nullable
              as List<GalleryImage>,
      selectedCategoryClicked: freezed == selectedCategoryClicked
          ? _value.selectedCategoryClicked
          : selectedCategoryClicked // ignore: cast_nullable_to_non_nullable
              as Category?,
    ));
  }
}

/// @nodoc

class _$_GalleryAdminState implements _GalleryAdminState {
  const _$_GalleryAdminState(
      {required final List<Category> categoryList,
      required final List<GalleryImage> imageList,
      required final List<Category> selectedCategoriesMarked,
      required final List<GalleryImage> selectedImagesMarked,
      this.selectedCategoryClicked})
      : _categoryList = categoryList,
        _imageList = imageList,
        _selectedCategoriesMarked = selectedCategoriesMarked,
        _selectedImagesMarked = selectedImagesMarked;

  final List<Category> _categoryList;
  @override
  List<Category> get categoryList {
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryList);
  }

  final List<GalleryImage> _imageList;
  @override
  List<GalleryImage> get imageList {
    if (_imageList is EqualUnmodifiableListView) return _imageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageList);
  }

  final List<Category> _selectedCategoriesMarked;
  @override
  List<Category> get selectedCategoriesMarked {
    if (_selectedCategoriesMarked is EqualUnmodifiableListView)
      return _selectedCategoriesMarked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCategoriesMarked);
  }

  final List<GalleryImage> _selectedImagesMarked;
  @override
  List<GalleryImage> get selectedImagesMarked {
    if (_selectedImagesMarked is EqualUnmodifiableListView)
      return _selectedImagesMarked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedImagesMarked);
  }

  @override
  final Category? selectedCategoryClicked;

  @override
  String toString() {
    return 'GalleryAdminState(categoryList: $categoryList, imageList: $imageList, selectedCategoriesMarked: $selectedCategoriesMarked, selectedImagesMarked: $selectedImagesMarked, selectedCategoryClicked: $selectedCategoryClicked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryAdminState &&
            const DeepCollectionEquality()
                .equals(other._categoryList, _categoryList) &&
            const DeepCollectionEquality()
                .equals(other._imageList, _imageList) &&
            const DeepCollectionEquality().equals(
                other._selectedCategoriesMarked, _selectedCategoriesMarked) &&
            const DeepCollectionEquality()
                .equals(other._selectedImagesMarked, _selectedImagesMarked) &&
            (identical(
                    other.selectedCategoryClicked, selectedCategoryClicked) ||
                other.selectedCategoryClicked == selectedCategoryClicked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryList),
      const DeepCollectionEquality().hash(_imageList),
      const DeepCollectionEquality().hash(_selectedCategoriesMarked),
      const DeepCollectionEquality().hash(_selectedImagesMarked),
      selectedCategoryClicked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GalleryAdminStateCopyWith<_$_GalleryAdminState> get copyWith =>
      __$$_GalleryAdminStateCopyWithImpl<_$_GalleryAdminState>(
          this, _$identity);
}

abstract class _GalleryAdminState implements GalleryAdminState {
  const factory _GalleryAdminState(
      {required final List<Category> categoryList,
      required final List<GalleryImage> imageList,
      required final List<Category> selectedCategoriesMarked,
      required final List<GalleryImage> selectedImagesMarked,
      final Category? selectedCategoryClicked}) = _$_GalleryAdminState;

  @override
  List<Category> get categoryList;
  @override
  List<GalleryImage> get imageList;
  @override
  List<Category> get selectedCategoriesMarked;
  @override
  List<GalleryImage> get selectedImagesMarked;
  @override
  Category? get selectedCategoryClicked;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryAdminStateCopyWith<_$_GalleryAdminState> get copyWith =>
      throw _privateConstructorUsedError;
}
