
// RESPONSIVENESS TO WORK BOTH IN MOBILE AND WEB



import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  Responsive(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  bool get isSmallScreen => width < 600;
  bool get isMediumScreen => width >= 600 && width < 900;
  bool get isLargeScreen => width >= 900;

  double scale(double size) {
    if (isSmallScreen) return size * 0.8;
    if (isMediumScreen) return size * 1.0;
    return size * 1.2;
  }

  double getIconSize() {
    if (isSmallScreen) return 24;
    if (isMediumScreen) return 32;
    return 40;
  }

  EdgeInsets getPadding() {
    return EdgeInsets.symmetric(horizontal: scale(16), vertical: scale(8));
  }
}
