import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dialog.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/format_file_size.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/transform_date.dart';
import 'package:fotodesk/features/gallery_administration/presentation/cubit/gallery_admin_cubit.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/gallery_image.dart';

class GalleryAdministrationPage extends StatefulWidget {
  const GalleryAdministrationPage({Key? key}) : super(key: key);

  @override
  GalleryAdministrationPageState createState() =>
      GalleryAdministrationPageState();
}

class GalleryAdministrationPageState extends State<GalleryAdministrationPage> {
  @override
  void initState() {
    context.read<GalleryAdminCubit>().getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryAdminCubit, GalleryAdminState>(
      builder: (context, state) {
        final categories = state.categoryList;
        final categoryClicked = state.selectedCategoryClicked;
        return Column(
          children: [
            _header(categoryClicked != null),
            Expanded(
                child: categoryClicked != null
                    ? categoryClicked.images!.isNotEmpty
                        ? ListView.builder(
                            itemCount: categoryClicked.images!.length,
                            itemBuilder: (context, index) {
                              final fileItem = categoryClicked.images![index];
                              final isSelected =
                                  state.selectedImagesMarked.contains(fileItem);
                              return _listTile(
                                fileItem,
                                isSelected: isSelected,
                                index: index,
                                onTapOpenListTile: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomDialog(
                                        title: Text(
                                            '${fileItem.originalFilename}'),
                                        content: CachedNetworkImage(
                                          imageUrl:
                                              "https://backend.fotogalerie-wolfram-wildner.de/${fileItem.url!}",
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                        actions: <Widget>[
                                          CustomButton(
                                            label: 'Close',
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                checkBoxOnChanged: (bool? value) {
                                  if (value == true) {
                                    context
                                        .read<GalleryAdminCubit>()
                                        .markImages(fileItem);
                                  } else if (value == false) {
                                    context
                                        .read<GalleryAdminCubit>()
                                        .unmarkImages(fileItem);
                                  }
                                },
                                onTapMarkListTile: () {
                                  if (isSelected) {
                                    context
                                        .read<GalleryAdminCubit>()
                                        .unmarkImages(fileItem);
                                  } else {
                                    context
                                        .read<GalleryAdminCubit>()
                                        .markImages(fileItem);
                                  }
                                },
                              );
                            },
                          )
                        : const Center(
                            child: Text(
                                'Fügen Sie neue Bilder zur Galerie hinzu.'))
                    : categories.isNotEmpty
                        ? ListView.builder(
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final categoryItem = categories[index];
                              final isSelected = state.selectedCategoriesMarked
                                  .contains(categoryItem);
                              return _listTile(
                                categoryItem,
                                isSelected: isSelected,
                                index: index,
                                onTapOpenListTile: () {
                                  context
                                      .read<GalleryAdminCubit>()
                                      .setCategoryAsClicked(categoryItem);
                                },
                                onTapMarkListTile: () {
                                  if (isSelected) {
                                    context
                                        .read<GalleryAdminCubit>()
                                        .unmarkCategories(categoryItem);
                                  } else {
                                    context
                                        .read<GalleryAdminCubit>()
                                        .markCategories(categoryItem);
                                  }
                                },
                                checkBoxOnChanged: (bool? value) {
                                  if (value == true) {
                                    context
                                        .read<GalleryAdminCubit>()
                                        .markCategories(categoryItem);
                                  } else if (value == false) {
                                    context
                                        .read<GalleryAdminCubit>()
                                        .unmarkCategories(categoryItem);
                                  }
                                },
                              );
                            },
                          )
                        : const Center(
                            child: Text('Fügen Sie neue Kategorien hinzu.')))
          ],
        );
      },
    );
  }

  String _determineFileType(dynamic fileItem) {
    if (fileItem is Category) {
      return 'Ordner';
    } else if (fileItem is GalleryImage) {
      return fileItem.mimeType ?? '--';
    } else {
      return '--'; // default if the type is not determined
    }
  }

  Widget _listTile(dynamic fileItem,
      {required bool isSelected,
      required int index,
      required void Function()? onTapOpenListTile,
      required void Function()? onTapMarkListTile,
      required void Function(bool?)? checkBoxOnChanged}) {
    return InkWell(
      onTap: onTapOpenListTile,
      child: Container(
        color: determineTileColor(isSelected, index),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                  onTap: onTapMarkListTile,
                  child: Checkbox(
                    value: isSelected,
                    onChanged: checkBoxOnChanged,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            fileItem is GalleryImage
                ? Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Image.network(
                        "https://backend.fotogalerie-wolfram-wildner.de/${fileItem.url!}",
                        fit: BoxFit.fitWidth,
                        width: 65.w,
                        height: 100.h,
                      ),
                    ),
                  )
                : Container(),
            Expanded(
              flex: 2,
              child: Text(
                  fileItem is GalleryImage
                      ? fileItem.originalFilename
                      : fileItem.name,
                  style: TextStyle(fontSize: 14.w)),
            ),
            Expanded(
              flex: 1,
              child: Text(
                fileItem is GalleryImage
                    ? FormatFileSize().format(fileItem.fileSize ?? 0).toString()
                    : fileItem.size.toString(),
                style: TextStyle(fontSize: 14.w),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(TransformDate().getDate(fileItem.lastModifiedDate),
                  style: TextStyle(fontSize: 14.w)),
            ),
            Expanded(
              flex: 2,
              child: Text(_determineFileType(fileItem),
                  style: TextStyle(fontSize: 14.w)),
            ),
          ],
        ),
      ),
    );
  }

  Color? determineTileColor(bool isSelected, int index) {
    if (isSelected) {
      return Theme.of(context).colorScheme.secondary;
    } else if (index % 2 == 0) {
      return Theme.of(context).colorScheme.primary.withOpacity(.1);
    } else {
      return Theme.of(context).colorScheme.surface;
    }
  }

  _header(bool isGalleryImage) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(
              width: 55,
            ),
            if (isGalleryImage)
              Expanded(
                flex: 2,
                child: Text('Bild', style: TextStyle(fontSize: 14.w)),
              ),
            Expanded(
              flex: 2,
              child: Text('Name', style: TextStyle(fontSize: 14.w)),
            ),
            Expanded(
              flex: 1,
              child: Text('Größe', style: TextStyle(fontSize: 14.w)),
            ),
            Expanded(
              flex: 2,
              child:
                  Text('Zuletzt bearbeitet', style: TextStyle(fontSize: 14.w)),
            ),
            Expanded(
              flex: 2,
              child: Text('Art', style: TextStyle(fontSize: 14.w)),
            ),
          ],
        ),
      ),
    );
  }
}
