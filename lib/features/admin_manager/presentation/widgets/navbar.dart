import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dialog.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dropdown.dart';
import 'package:fotodesk/features/admin_manager/presentation/cubit/admin_manager_cubit.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/settings_page.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/user_info_page.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/gallery_image.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/pick_files_from_desktop.dart';
import 'package:fotodesk/features/gallery_administration/presentation/widgets/add_new_category_dialog.dart';
import 'package:fotodesk/features/gallery_administration/presentation/widgets/delete_dialog.dart';
import 'package:fotodesk/features/gallery_administration/presentation/widgets/show_image_info_dialog.dart';
import 'package:fotodesk/features/gallery_administration/presentation/widgets/update_category_dialog.dart';

import '../../../../core/features/ui/presentation/widgets/animations/switch_in_switch_out.dart';
import '../../../gallery_administration/domain/entities/category.dart';
import '../../../gallery_administration/presentation/cubit/gallery_admin_cubit.dart';
import 'navbar_button.dart';

enum NavBarItem {
  home,
  gallery,
  customers,
  calendar,
  help,
  logout,
  chat,
  ecommerce
}

class Navbar extends StatelessWidget {
  final Widget mainContent;

  const Navbar({super.key, required this.mainContent});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _sideNavbar(context),
        Expanded(
          child: Column(
            children: [
              _topNavbar(context),
              Expanded(child: mainContent),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sideNavbar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.h),
            topRight: Radius.circular(16.h)),
      ),
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 16.h),
          const Icon(
            Icons.center_focus_strong,
            color: Colors.white,
          ),
          SizedBox(height: 25.h),
          const NavBarButton(
            label: 'Home',
            icon: Icons.home,
            navBarItem: NavBarItem.home,
          ),
          const NavBarButton(
            label: 'Chat',
            icon: Icons.chat_bubble_outline_rounded,
            navBarItem: NavBarItem.chat,
          ),
          const NavBarButton(
            label: 'Ecommerce',
            icon: Icons.shop,
            navBarItem: NavBarItem.ecommerce,
          ),
          const NavBarButton(
            label: 'Gallery',
            icon: Icons.photo_album,
            navBarItem: NavBarItem.gallery,
          ),
          const NavBarButton(
            label: 'Customers',
            icon: Icons.people,
            navBarItem: NavBarItem.customers,
          ),
          const NavBarButton(
            label: 'Calendar',
            icon: Icons.calendar_month,
            navBarItem: NavBarItem.calendar,
          ),
          SizedBox(height: 25.h),
          const NavBarButton(
            label: 'Logout',
            icon: Icons.logout,
            navBarItem: NavBarItem.logout,
          ),
        ],
      ),
    );
  }

  Widget _topNavbar(BuildContext context) {
    return Container(
        height: 75.h,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topLeft: Radius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: _getNavbarContent(context)),
            SizedBox(
              width: 25.h,
            ),
            const VerticalDivider(),
            SizedBox(
              width: 25.h,
            ),
            _profile(context),
          ],
        ));
  }

  Widget _getNavbarContent(BuildContext context) {
    final selected = context.watch<AdminManagerCubit>().state.selectedType;
    final categoriesMarked =
        context.watch<GalleryAdminCubit>().state.selectedCategoriesMarked;
    final categoryClicked =
        context.watch<GalleryAdminCubit>().state.selectedCategoryClicked;
    final imagesMarked =
        context.watch<GalleryAdminCubit>().state.selectedImagesMarked;

    Widget content;
    if (selected == NavBarItem.home) {
      content = _homeContent(context);
    } else if (selected == NavBarItem.gallery) {
      content = _galleryContent(
          categoriesMarked, categoryClicked, imagesMarked, context);
    } else if (selected == NavBarItem.chat) {
      content = _chatContent(context);
    } else if (selected == NavBarItem.ecommerce) {
      content = _eCommerceContent(context);
    } else {
      content = _defaultContent(context);
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1), // Starts from above (outside of view)
            end: const Offset(0, 0), // Ends at its original position
          ).animate(animation),
          child: child,
        );
      },
      child: content,
    );
  }

  Widget _homeContent(BuildContext context) {
    return Align(
      key: const ValueKey('home'),
      alignment: Alignment.centerLeft,
      child: _navBarTitle('Home Page', context),
    );
  }

  Widget _galleryContent(
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
        child: _navBarTitle(
          'Gallerie Administration',
          context,
          categoryClicked: categoryClicked,
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
      List<File>? imageFiles;
      children.add(
        SwitchInSwitchOut(
          key: const ValueKey('uploadButton'),
          child: CustomButton(
            iconData: Icons.upload,
            label: 'Bilder hochladen',
            onPressed: () async {
              imageFiles = await PickFilesFromDesktop().pickMultipleImages();
              if (imageFiles != null) {
                galleryAdminCubit.uploadImages(categoryClicked, imageFiles!);
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

  Widget _defaultContent(BuildContext context) {
    return Align(
      key: const ValueKey('other'),
      alignment: Alignment.centerLeft,
      child: _navBarTitle('Something other', context),
    );
  }

  Widget _navBarTitle(String title, BuildContext context,
      {Key? key, Category? categoryClicked}) {
    final galleryCubit = context.read<GalleryAdminCubit>();
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      child: categoryClicked != null
          ? Row(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => {
                        galleryCubit.deSetCategoryAsClicked(categoryClicked),
                        galleryCubit.unmarkAllImages()
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 10.w),
                          Icon(Icons.chevron_left,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.75)),
                          SizedBox(width: 10.w),
                          Text(
                            title,
                            key: key,
                            style: TextStyle(
                              fontSize: 15.h,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.75),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      ' / ${categoryClicked.name}',
                      style: TextStyle(
                        fontSize: 15.h,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withOpacity(.75),
                      ),
                    ),
                  ],
                ),
                // Breadcrumb
              ],
            )
          : Row(
              children: [
                SizedBox(width: 10.w),
                Icon(Icons.chevron_left,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.2)),
                SizedBox(width: 10.w),
                Text(
                  title,
                  key: key,
                  style: TextStyle(
                    fontSize: 15.h,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.75),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _profile(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
                iconSize: 24.r,
              ),
              Positioned(
                top: 5.h,
                right: 5.w,
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12.w,
                    minHeight: 12.h,
                  ),
                  child: Text(
                    '1', // This can be replaced with a count of unread notifications
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 8.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 16.w,
          ),
          CustomDropdown<int>(
            items: const [
              PopupMenuItem(
                value: 1,
                child: Text('Benutzerprofil'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Einstellungen'),
              ),
              // ... other menu items ...
            ],
            onSelected: (value) {
              switch (value) {
                case 1:
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          width: 600.w,
                          height: 600.h,
                          title: const Text('Einstellungen'),
                          content: const UserInfoPage(),
                        );
                      });
                  break;
                case 2:
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                            width: 600.w,
                            height: 600.h,
                            title: const Text('Einstellungen'),
                            content: const SettingsPage(),
                            actions: [
                              CustomButton(label: 'Speichern', onPressed: () {})
                            ]);
                      });
                  break;
              }
            },
            child: CircleAvatar(
              radius: 22.5.r,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                Icons.person,
                size: 16.r,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _chatContent(BuildContext context) {
    return Align(
      key: const ValueKey('chat'),
      alignment: Alignment.centerLeft,
      child: _navBarTitle('Fotodesk Chat AI', context),
    );
  }

  Widget _eCommerceContent(BuildContext context) {
    return Align(
      key: const ValueKey('ecommerce'),
      alignment: Alignment.centerLeft,
      child: _navBarTitle('Ecommerce Anbindung', context),
    );
  }
}
