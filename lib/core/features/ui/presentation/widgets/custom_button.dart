// /lib/ui_components/custom_button.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final IconData? iconData;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 45,
    this.height = 50,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: OutlinedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(width.w, height.h),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content
          children: <Widget>[
            iconData != null
                ? Icon(
                    iconData,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20.w,
                  )
                : Container(
                    width: 0,
                  ),
            const SizedBox(
                width: 8.0), // Some spacing between the icon and the label
            Text(
              label,
              style: TextStyle(color: Colors.black54, fontSize: 13.w),
            ),
          ],
        ),
      ),
    );
  }
}
