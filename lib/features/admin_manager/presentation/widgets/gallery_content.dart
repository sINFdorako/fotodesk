import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/notifications/presentation/widgets/notifications.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/animations/switch_in_switch_out.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/global_font_size.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/navbar_title.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/category.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/file_pick_info.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/gallery_image.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/pick_files_from_desktop.dart';
import 'package:fotodesk/features/gallery_administration/presentation/cubit/gallery_admin_cubit.dart';
import 'package:fotodesk/features/gallery_administration/presentation/widgets/add_new_category_dialog.dart';
import 'package:fotodesk/features/gallery_administration/presentation/widgets/delete_dialog.dart';
import 'package:fotodesk/features/gallery_administration/presentation/widgets/show_image_info_dialog.dart';
import 'package:fotodesk/features/gallery_administration/presentation/widgets/update_category_dialog.dart';

class GalleryContent {
  render(
    List<Category> categoriesMarked,
    Category? categoryClicked,
    List<GalleryImage> imagesMarked,
    BuildContext context,
  ) {
    final galleryAdminCubit = context.read<GalleryAdminCubit>();
    List<Widget> children = [
      SwitchInSwitchOut(
        key: categoryClicked != null
            ? ValueKey('galleryTitle/${categoryClicked.name}')
            : const ValueKey('galleryTitle'),
        child: NavbarTitle(
          categoryClicked: categoryClicked,
          title: 'Gallerie Administration',
        ),
      ),
      Expanded(child: Container())
    ];

    if (categoriesMarked.length == 1) {
      children.addAll([
        SwitchInSwitchOut(
          key: const ValueKey('deleteButton'),
          child: CustomButton(
            iconData: Icons.delete,
            label: 'Kategorie löschen',
            onPressed: () {
              List<int> idsToDelete =
                  categoriesMarked.map((category) => category.id!).toList();
              List<String> categoryNamesToDelete =
                  categoriesMarked.map((category) => category.name).toList();
              String contentText =
                  'Sind sie sicher dass sie die Kateogorien: ${categoryNamesToDelete.join(', ')} löschen möchten?';
              ConfirmDeleteDialog().dialog(context, contentText, () {
                galleryAdminCubit.deleteCategory(idsToDelete);
              });
            },
          ),
        ),
        const SizedBox(width: 16),
        SwitchInSwitchOut(
          key: const ValueKey('editButton'),
          child: CustomButton(
            iconData: Icons.edit,
            label: 'Kategorie bearbeiten',
            onPressed: () =>
                {UpdateCategoryDialog().dialog(context, categoriesMarked[0])},
          ),
        ),
      ]);
    }

    if (categoriesMarked.length > 1) {
      children.addAll([
        SwitchInSwitchOut(
          key: const ValueKey('deleteButton'),
          child: CustomButton(
            iconData: Icons.delete,
            label: 'Kategorien löschen',
            onPressed: () {
              List<int> idsToDelete =
                  categoriesMarked.map((category) => category.id!).toList();
              List<String> categoryNamesToDelete =
                  categoriesMarked.map((category) => category.name).toList();
              String contentText =
                  'Sind sie sicher dass sie die Kateogorien: ${categoryNamesToDelete.join(', ')} löschen möchten?';
              ConfirmDeleteDialog().dialog(context, contentText, () {
                galleryAdminCubit.deleteCategory(idsToDelete);
              });
            },
          ),
        ),
      ]);
    }

    if (categoryClicked != null && imagesMarked.isEmpty) {
      List<FilePickInfo>? imageFiles;
      children.add(
        SwitchInSwitchOut(
          key: const ValueKey('uploadButton'),
          child: CustomButton(
            iconData: Icons.upload,
            label: 'Bilder hochladen',
            onPressed: () async {
              imageFiles =
                  await PickFilesFromDesktop().pickMultipleImages(context);
              if (imageFiles != null) {
                List<Uint8List?> uploadSizeList =
                    imageFiles!.map((info) => info.bytes).toList();
                double totalUploadSize = _sumBytesInMB(uploadSizeList);

                if (totalUploadSize > 100) {
                  Notifications(context).showError(
                      toastDuration: const Duration(seconds: 7),
                      description:
                          'Das gleichzeitige Hochladen ist auf 100 MB beschränkt. Bitte reduzieren Sie die Dateigröße oder laden Sie weniger Bilder hoch.');
                  galleryAdminCubit.deactivateLoading();
                  return;
                }

                List<Duration?> allDurations = imageFiles!
                    .map((info) => info.estimatedUploadTime)
                    .toList();

                Duration totalEstimatedTime = _sumDurations(allDurations);

                String estimatedTimeString = totalEstimatedTime.inSeconds < 60
                    ? '${totalEstimatedTime.inSeconds} Sekunden'
                    : '${totalEstimatedTime.inMinutes} Minuten';

                String additionalInfo = totalEstimatedTime.inMinutes > 11
                    ? 'Bitte vergewissern Sie sich, dass Ihre Internetverbindung eine Upload-Geschwindigkeit von mindestens 3-5 mb/s bietet. Bei langsameren Verbindungen wird der Upload nach 24 Minuten automatisch abgebrochen. Überlegen Sie in solchen Fällen, weniger Bilder gleichzeitig hochzuladen.'
                    : '';

                String picturesAreBeingUploaded = imageFiles!.length > 1
                    ? '${imageFiles!.length} Bilder werden hochgeladen'
                    : '${imageFiles!.length} Bild wird hochgeladen';

                double dialogWidth =
                    totalEstimatedTime.inMinutes > 11 ? 400.w : 360.w;
                double dialogHeight =
                    totalEstimatedTime.inMinutes > 11 ? 300.h : 100.h;

                if (totalEstimatedTime.inSeconds > 0) {
                  Notifications(context).showInfo(
                      customDescription: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '$picturesAreBeingUploaded. Es wird ca. $estimatedTimeString dauern.'),
                          if (additionalInfo.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(additionalInfo,
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: FontUtil.notification)),
                            ),
                          const SizedBox(
                            height: 8,
                          ),
                          const CircularProgressIndicator()
                        ],
                      ),
                      toastDuration: totalEstimatedTime,
                      width: dialogWidth,
                      height: dialogHeight);
                }

                await galleryAdminCubit.uploadImages(
                    categoryClicked, imageFiles!);

                galleryAdminCubit.deactivateLoading();

                Notifications(context).dismissCurrentNotification();
              }
            },
          ),
        ),
      );
    }

    if (imagesMarked.length == 1) {
      children.addAll([
        SwitchInSwitchOut(
          key: const ValueKey('deleteImageButton'),
          child: CustomButton(
            iconData: Icons.delete,
            label: 'Bild löschen',
            onPressed: () {
              List<int> idsToDelete =
                  imagesMarked.map((image) => image.id!).toList();
              List<String> imageNamesToDelete =
                  imagesMarked.map((image) => image.originalFilename!).toList();
              galleryAdminCubit.deleteCategory(idsToDelete);
              String contentText =
                  'Sind sie sicher dass sie die Bilder: ${imageNamesToDelete.join(', ')} löschen möchten?';
              ConfirmDeleteDialog().dialog(context, contentText, () {
                galleryAdminCubit.deleteImages(categoryClicked!, idsToDelete);
              });
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        SwitchInSwitchOut(
          key: const ValueKey('imageInformationButton'),
          child: CustomButton(
            iconData: Icons.info,
            label: 'Bild Informationen',
            onPressed: () async =>
                ShowImageInfoDialog().show(context, imagesMarked),
          ),
        ),
      ]);
    }

    if (imagesMarked.length > 1) {
      children.addAll([
        SwitchInSwitchOut(
          key: const ValueKey('deleteImageButton'),
          child: CustomButton(
            iconData: Icons.delete,
            label: 'Bilder löschen',
            onPressed: () {
              List<int> idsToDelete =
                  imagesMarked.map((image) => image.id!).toList();
              List<String> imageNamesToDelete =
                  imagesMarked.map((image) => image.originalFilename!).toList();
              galleryAdminCubit.deleteCategory(idsToDelete);
              String contentText =
                  'Sind sie sicher dass sie die Bilder: ${imageNamesToDelete.join(', ')} löschen möchten?';
              ConfirmDeleteDialog().dialog(context, contentText, () {
                galleryAdminCubit.deleteImages(categoryClicked!, idsToDelete);
              });
            },
          ),
        ),
      ]);
    }

    if (categoryClicked == null && categoriesMarked.isEmpty) {
      children.add(
        SwitchInSwitchOut(
          key: const ValueKey('newCategoryButton'),
          child: CustomButton(
            iconData: Icons.image_outlined,
            label: 'Neue Kategorie',
            onPressed: () => addNewCategory(context),
          ),
        ),
      );
    }

    return Align(
      key: const ValueKey('galleryTitle'),
      alignment: Alignment.centerLeft,
      child: Row(children: children),
    );
  }

  Duration _sumDurations(List<Duration?> durations) {
    if (durations.isNotEmpty) {
      int totalSeconds =
          durations.fold(0, (sum, duration) => sum + duration!.inSeconds);
      return Duration(seconds: totalSeconds);
    }
    return const Duration();
  }

  double _sumBytesInMB(List<Uint8List?> bytesList) {
    if (bytesList.isNotEmpty) {
      int totalBytes =
          bytesList.fold(0, (sum, bytes) => sum + (bytes?.length ?? 0));
      return totalBytes / (1024 * 1024); // Convert bytes to MB
    }
    return 0.0;
  }
}
