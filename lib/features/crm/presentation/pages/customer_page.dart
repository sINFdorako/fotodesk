import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/file_system.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FileSystem().headerCRM(context),
        Center(
          child: Column(
            children: [
              SizedBox(height: 150.h),
              Text(
                'Noch keine Kundendaten angelegt ..',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(.7),
                ),
              ),
              SizedBox(
                height: 45.h,
              ),
              SvgPicture.asset(
                'assets/images/website_undraw.svg',
                width: 50.w,
                height: 160.h,
              )
            ],
          ),
        ),
      ],
    );
  }
}
