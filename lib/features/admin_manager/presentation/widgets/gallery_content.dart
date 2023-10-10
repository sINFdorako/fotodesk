import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/animations/switch_in_switch_out.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/navbar_title.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/category.dart';
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
      List<dynamic>? imageFiles;
      children.add(
        SwitchInSwitchOut(
          key: const ValueKey('uploadButton'),
          child: CustomButton(
            iconData: Icons.upload,
            label: 'Bilder hochladen',
            onPressed: () async {
              imageFiles = await PickFilesFromDesktop().pickMultipleImages();
              if (imageFiles != null) {
                galleryAdminCubit.acitvateLoading();
                await galleryAdminCubit.uploadImages(
                    categoryClicked, imageFiles!);
                galleryAdminCubit.deactivateLoading();
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
}
