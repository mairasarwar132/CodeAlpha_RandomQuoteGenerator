import 'package:flutter/widgets.dart';

class ResponsiveLayout {
  const ResponsiveLayout._();

  static bool isCompact(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 600;
  }

  static EdgeInsets pagePadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= 1100) {
      return const EdgeInsets.symmetric(horizontal: 56, vertical: 32);
    }

    if (width >= 700) {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 28);
    }

    return const EdgeInsets.symmetric(horizontal: 20, vertical: 20);
  }
}
