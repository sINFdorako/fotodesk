import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/features/admin_manager/presentation/cubit/admin_manager_cubit.dart';
import 'package:fotodesk/features/gallery_administration/presentation/pages/gallery_administration_page.dart';

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

    Widget content;
    switch (selected) {
      case NavBarItem.home:
        content = Align(
          key: const ValueKey('home'),
          alignment: Alignment.centerLeft,
          child: _navBarTitle('Home Page', context, const ValueKey('home')),
        );
        break;
      case NavBarItem.gallery:
        content = Align(
          key: const ValueKey('galleryTitle'),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              _navBarTitle('Gallery Administration', context,
                  const ValueKey('galleryTitle')),
              Expanded(child: Container()),
              CustomButton(
                  label: 'Neue Kategory',
                  onPressed: () {
                    addNewCategory(context);
                  }),
            ],
          ),
        );
        break;
      default:
        content = Align(
          key: const ValueKey('other'),
          alignment: Alignment.centerLeft,
          child:
              _navBarTitle('Something other', context, const ValueKey('other')),
        );
        break;
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

  Widget _navBarTitle(String title, BuildContext context, [Key? key]) {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      child: Text(
        key: key,
        title,
        style: TextStyle(
          fontSize: 20.h,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.85),
        ),
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
