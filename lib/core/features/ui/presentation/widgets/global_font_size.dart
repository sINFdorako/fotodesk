import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontUtil {
  // Headings
  static double get h1 => _ensureMinSize(24.sp, 20);
  static double get h2 => _ensureMinSize(20.sp, 18);

  // Paragraph
  static double get paragraph => _ensureMinSize(15.sp, 14);

  // Buttons
  static double get button => _ensureMinSize(13.sp, 11);

  // Hint or subdued text
  static double get hint => _ensureMinSize(13.sp, 11);

  static double get notification => _ensureMinSize(13.sp, 11);

  // Utility to ensure the font size doesn't drop below the minimum
  static double _ensureMinSize(double scaledSize, double minSize) {
    return scaledSize < minSize ? minSize : scaledSize;
  }
}
