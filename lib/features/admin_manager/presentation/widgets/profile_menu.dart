import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dialog.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dropdown.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/settings_page.dart';
import 'package:fotodesk/features/admin_manager/presentation/widgets/user_info_page.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Row(
                  children: [
                    Icon(Icons.person), // Icon for the Benutzerprofil
                    SizedBox(width: 8.0),
                    Text('Benutzerprofil'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.info), // Icon for the Einstellungen
                    SizedBox(width: 8.0),
                    Text('Fotodesk Pro Info'),
                  ],
                ),
              ),
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
                          title: const Text('Benutzerprofil'),
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
                            title: const Text('Fotodesk Pro Info'),
                            content: const SettingsPage(),
                            actions: [
                              CustomButton(
                                  label: 'Schließen',
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  })
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
}
