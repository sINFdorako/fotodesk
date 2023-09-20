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
        _sideNavbar(),
        Expanded(
          child: Stack(
            children: [
              mainContent,
              Align(
                alignment: Alignment.topRight,
                child: _topRightNavbar(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sideNavbar() {
    return Container(
      margin: EdgeInsets.only(
        left: 8.w,
        top: 8.h,
        bottom: 8.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4D8076),
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
              color: Colors.black38,
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

  Widget _topRightNavbar() {
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
                top: 10.h,
                right: 10.w,
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4D8076),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12.w,
                    minHeight: 12.h,
                  ),
                  child: Text(
                    '!', // This can be replaced with a count of unread notifications
                    style: TextStyle(
                      color: Colors.white,
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
            backgroundColor: const Color(0xFF4D8076),
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
