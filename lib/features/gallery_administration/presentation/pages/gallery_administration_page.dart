import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dialog.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/file_system.dart';
import 'package:fotodesk/features/gallery_administration/presentation/cubit/gallery_admin_cubit.dart';
import 'package:fotodesk/features/gallery_administration/presentation/widgets/loading_rows.dart';

import '../../domain/entities/category.dart';

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
            FileSystem()
                .headerPersonalGallery(categoryClicked != null, context),
            Expanded(
                child: categoryClicked != null
                    ? categoryClicked.images!.isNotEmpty
                        ? state.isLoading
                            ? const LoadingRows()
                            : ListView.builder(
                                itemCount: categoryClicked.images!.length,
                                itemBuilder: (context, index) {
                                  final fileItem =
                                      categoryClicked.images![index];
                                  final isSelected = state.selectedImagesMarked
                                      .contains(fileItem);
                                  return FileSystem().listTilePersonalGallery(
                                      fileItem,
                                      isSelected: isSelected,
                                      index: index, onTapOpenListTile: () {
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
                                            errorWidget:
                                                (context, url, error) =>
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
                                  }, checkBoxOnChanged: (bool? value) {
                                    if (value == true) {
                                      context
                                          .read<GalleryAdminCubit>()
                                          .markImages(fileItem);
                                    } else if (value == false) {
                                      context
                                          .read<GalleryAdminCubit>()
                                          .unmarkImages(fileItem);
                                    }
                                  }, onTapMarkListTile: () {
                                    if (isSelected) {
                                      context
                                          .read<GalleryAdminCubit>()
                                          .unmarkImages(fileItem);
                                    } else {
                                      context
                                          .read<GalleryAdminCubit>()
                                          .markImages(fileItem);
                                    }
                                  }, context: context);
                                },
                              )
                        : state.isLoading
                            ? const LoadingRows()
                            : const Center(
                                child: Text(
                                    'Fügen Sie neue Bilder zur Galerie hinzu.'))
                    : categories.isNotEmpty
                        ? ListView.builder(
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              Category categoryItem = categories[index];
                              final isSelected = state.selectedCategoriesMarked
                                  .contains(categoryItem);
                              return FileSystem().listTilePersonalGallery(
                                  categoryItem,
                                  isSelected: isSelected,
                                  index: index, onTapOpenListTile: () {
                                context
                                    .read<GalleryAdminCubit>()
                                    .setCategoryAsClicked(categoryItem);
                              }, onTapMarkListTile: () {
                                if (isSelected) {
                                  context
                                      .read<GalleryAdminCubit>()
                                      .unmarkCategories(categoryItem);
                                } else {
                                  context
                                      .read<GalleryAdminCubit>()
                                      .markCategories(categoryItem);
                                }
                              }, checkBoxOnChanged: (bool? value) {
                                if (value == true) {
                                  context
                                      .read<GalleryAdminCubit>()
                                      .markCategories(categoryItem);
                                } else if (value == false) {
                                  context
                                      .read<GalleryAdminCubit>()
                                      .unmarkCategories(categoryItem);
                                }
                              }, context: context);
                            },
                          )
                        : const Center(
                            child: Text('Fügen Sie neue Kategorien hinzu.')))
          ],
        );
      },
    );
  }
}
