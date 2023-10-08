import 'package:flutter/material.dart';

class ScreenSize {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;
}
