import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop, wide }

class Responsive {
  Responsive._();

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double wideBreakpoint = 1440;

  static DeviceType deviceTypeOf(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= wideBreakpoint) return DeviceType.wide;
    if (width >= tabletBreakpoint) return DeviceType.desktop;
    if (width >= mobileBreakpoint) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  static bool isMobile(BuildContext context) => deviceTypeOf(context) == DeviceType.mobile;

  static bool isTablet(BuildContext context) => deviceTypeOf(context) == DeviceType.tablet;

  static bool isDesktop(BuildContext context) {
    final type = deviceTypeOf(context);
    return type == DeviceType.desktop || type == DeviceType.wide;
  }

  /// Desktop nav / two-column layouts switch on at >=1024.
  static bool isDesktopNav(BuildContext context) => MediaQuery.sizeOf(context).width >= tabletBreakpoint;

  static int gridColumns(BuildContext context, {int mobile = 1, int tablet = 2, int desktop = 3, int wide = 3}) {
    switch (deviceTypeOf(context)) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet;
      case DeviceType.desktop:
        return desktop;
      case DeviceType.wide:
        return wide;
    }
  }
}

/// Builds a different widget per breakpoint instead of naively scaling one layout.
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder desktop;

  @override
  Widget build(BuildContext context) {
    final type = Responsive.deviceTypeOf(context);
    if (type == DeviceType.mobile) return mobile(context);
    if (type == DeviceType.tablet) return (tablet ?? desktop)(context);
    return desktop(context);
  }
}
