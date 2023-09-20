import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          child: Stack(
            children: [
              mainContent,
              Align(
                alignment: Alignment.topRight,
                child: _topRightNavbar(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sideNavbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 8.w,
        top: 8.h,
        bottom: 8.h,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      width: 115.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 16.h),
          Text(
            "LOGO",
            style: TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground,
            ),
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

  Widget _topRightNavbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, right: 10.h),
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
            radius: 30.r,
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
