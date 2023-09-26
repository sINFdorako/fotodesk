import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fotodesk/features/gallery_administration/presentation/cubit/gallery_admin_cubit.dart';
import 'package:intl/intl.dart';

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
            _header(),
            Expanded(
                child: categoryClicked != null
                    ? ListView.builder(
                        itemCount: categoryClicked.images!.length,
                        itemBuilder: (context, index) {
                          final fileItem = categoryClicked.images![index];
                          const isSelected = false;
                          return _listTile(
                            fileItem,
                            isSelected: isSelected,
                            index: index,
                            onTapOpenListTile: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "https://backend.fotogalerie-wolfram-wildner.de/${fileItem.url!}",
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    );
                                  });
                            },
                            onTapMarkListTile: () {
                              // ignore: dead_code
                              if (isSelected) {
                              } else {}
                            },
                            checkBoxOnChanged: (bool? value) {
                              if (value == true) {
                              } else if (value == false) {}
                            },
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final fileItem = categories[index];
                          final isSelected =
                              state.selectedCategoryMarked == fileItem;
                          return _listTile(
                            fileItem,
                            isSelected: isSelected,
                            index: index,
                            onTapOpenListTile: () {
                              context
                                  .read<GalleryAdminCubit>()
                                  .setCategoryAsClicked(fileItem);
                            },
                            onTapMarkListTile: () {
                              if (isSelected) {
                                context
                                    .read<GalleryAdminCubit>()
                                    .unmarkCategory();
                              } else {
                                context
                                    .read<GalleryAdminCubit>()
                                    .markCategory(fileItem);
                              }
                            },
                            checkBoxOnChanged: (bool? value) {
                              if (value == true) {
                                context
                                    .read<GalleryAdminCubit>()
                                    .markCategory(fileItem);
                              } else if (value == false) {
                                context
                                    .read<GalleryAdminCubit>()
                                    .unmarkCategory();
                              }
                            },
                          );
                        },
                      )),
          ],
        );
      },
    );
  }

  String formatFileSize(int bytes) {
    if (bytes < 1024) {
      return "$bytes B"; // Bytes
    } else if (bytes < 1024 * 1024) {
      return "${(bytes / 1024).toStringAsFixed(2)} KB"; // Kilobytes
    } else if (bytes < 1024 * 1024 * 1024) {
      return "${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB"; // Megabytes
    } else {
      return "${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB"; // Gigabytes
    }
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
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onTapMarkListTile,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Checkbox(
                  value: isSelected,
                  onChanged: checkBoxOnChanged,
                ),
              ),
            ),
            VerticalDivider(
                width: 16, color: Theme.of(context).colorScheme.onBackground),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  fileItem is GalleryImage
                      ? Expanded(
                          child: Image.network(
                              "https://backend.fotogalerie-wolfram-wildner.de/${fileItem.url!}"),
                        )
                      : Container(),
                  Expanded(
                    flex: 3,
                    child: Text(fileItem is GalleryImage
                        ? fileItem.originalFilename
                        : fileItem.name),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(fileItem is GalleryImage
                        ? formatFileSize(fileItem.fileSize ?? 0).toString()
                        : fileItem.size.toString()),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(_getDate(fileItem.lastModifiedDate)),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(_determineFileType(fileItem)),
                  ),
                ],
              ),
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

  String _getDate(DateTime lastModifiedDate) {
    final datePart = DateFormat('d. MMMM', 'de_DE').format(lastModifiedDate);
    final timePart = DateFormat('HH:mm', 'de_DE').format(lastModifiedDate);

    return '$datePart um $timePart Uhr';
  }

  _header() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
          width: 1.0,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 3, child: Text('Name')),
            Expanded(flex: 1, child: Text('Größe')),
            Expanded(flex: 2, child: Text('Zuletzt bearbeitet')),
            Expanded(flex: 2, child: Text('Art')),
          ],
        ),
      ),
    );
  }
}

Future<void> addNewCategory(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      TextEditingController controller = TextEditingController();
      return AlertDialog(
        title: const Text('New Category'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter category name',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async => {Navigator.of(context).pop()},
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (controller.text.isNotEmpty) {
                await context
                    .read<GalleryAdminCubit>()
                    .createCategory(Category(name: controller.text.trim()));
                await context.read<GalleryAdminCubit>().getAllCategories();
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}
