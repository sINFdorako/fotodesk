import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/features/admin_manager/presentation/cubit/admin_manager_cubit.dart';
import 'package:fotodesk/features/gallery_administration/presentation/pages/gallery_administration_page.dart';

import '../../../../core/features/ui/presentation/widgets/animations/switch_in_switch_out.dart';
import '../../../gallery_administration/domain/entities/category.dart';
import '../../../gallery_administration/presentation/cubit/gallery_admin_cubit.dart';
import 'navbar_button.dart';

enum NavBarItem { home, gallery, customers, calendar, help, logout }

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
          SizedBox(height: 50.h),
          const NavBarButton(
            label: 'Home',
            icon: Icons.home,
            navBarItem: NavBarItem.home,
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
          const NavBarButton(
            label: 'Help',
            icon: Icons.help,
            navBarItem: NavBarItem.help,
          ),
          SizedBox(height: 50.h),
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
    final categoryMarked =
        context.watch<GalleryAdminCubit>().state.selectedCategoryMarked;
    final categoryClicked =
        context.watch<GalleryAdminCubit>().state.selectedCategoryClicked;

    Widget content;
    if (selected == NavBarItem.home) {
      content = _homeContent(context);
    } else if (selected == NavBarItem.gallery) {
      content = _galleryContent(categoryMarked, categoryClicked, context);
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

  Widget _galleryContent(Category? categoryMarked, Category? categoryClicked,
      BuildContext context) {
    List<Widget> children = [
      SwitchInSwitchOut(
          key: categoryClicked != null
              ? ValueKey('galleryTitle/${categoryClicked.name}')
              : const ValueKey('galleryTitle'),
          child: _navBarTitle(
            'Gallerie Administration',
            context,
            categoryClicked: categoryClicked,
          )),
      Expanded(child: Container())
    ];

    if (categoryMarked != null) {
      children.addAll([
        SwitchInSwitchOut(
          key: const ValueKey('deleteButton'),
          child: CustomButton(
            label: 'Kategorie löschen',
            onPressed: () => {},
          ),
        ),
        const SizedBox(width: 16),
        SwitchInSwitchOut(
          key: const ValueKey('editButton'),
          child: CustomButton(
            label: 'Kategorie bearbeiten',
            onPressed: () => {},
          ),
        ),
      ]);
    } else if (categoryClicked != null) {
      children.add(
        SwitchInSwitchOut(
          key: const ValueKey('uploadButton'),
          child: CustomButton(
            label: 'Bild hochladen',
            onPressed: () => {},
          ),
        ),
      );
    } else {
      children.add(
        SwitchInSwitchOut(
          key: const ValueKey('newCategoryButton'),
          child: CustomButton(
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

  Widget _animatedButton(String label, VoidCallback onPressed, ValueKey key) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: const Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
      child: CustomButton(
        key: key,
        label: label,
        onPressed: onPressed,
      ),
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
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      child: categoryClicked != null
          ? Row(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => context
                          .read<GalleryAdminCubit>()
                          .deSetCategoryAsClicked(categoryClicked),
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
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
            iconSize: 24.r,
          ),
          const SizedBox(
            width: 8,
          ),
          CircleAvatar(
            radius: 22.5.r,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.person,
              size: 16.r,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
