import 'package:flutter/material.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/responsive/responsive.dart';

/// Shared max-width + horizontal padding wrapper used by every section so
/// content aligns consistently down the page.
class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.verticalPadding = AppDimensions.spaceXxxl,
  });

  final Widget child;
  final Color? backgroundColor;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final horizontalPadding = isMobile ? AppDimensions.spaceLg : AppDimensions.spaceXl;

    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? verticalPadding * 0.6 : verticalPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppDimensions.maxContentWidth),
          child: child,
        ),
      ),
    );
  }
}
