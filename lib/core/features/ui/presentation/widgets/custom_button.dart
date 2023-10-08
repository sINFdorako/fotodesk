import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/global_font_size.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final IconData? iconData;
  final bool? isColor;
  final Color? customFontColor;

  const CustomButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.width = 45,
      this.height = 50,
      this.iconData,
      this.isColor,
      this.customFontColor});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: OutlinedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(width.w, height.h),
          ),
          foregroundColor: MaterialStateProperty.all((isColor ?? false)
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent), // Optional text color
          backgroundColor: MaterialStateProperty.all((isColor ?? false)
              ? Theme.of(context).colorScheme.primary.withOpacity(.3)
              : Colors.transparent), // Optional background color
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return (isColor ?? false)
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                    : null;
              }
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return (isColor ?? false)
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                    : null;
              }
              return null; // Defer to the default value on other states.
            },
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content
          children: <Widget>[
            if (iconData != null)
              Icon(
                iconData,
                color: Theme.of(context).colorScheme.primary,
                size: 20.w,
              ),
            if (iconData != null) SizedBox(width: 8.0.w),
            Text(
              label,
              style: TextStyle(
                color: customFontColor ??
                    Theme.of(context).colorScheme.onBackground.withOpacity(.85),
                fontSize: FontUtil.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
