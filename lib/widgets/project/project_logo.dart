import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// The project's own app icon, rendered as a small rounded-square badge.
/// Renders nothing if the project has no logo file.
class ProjectLogo extends StatelessWidget {
  const ProjectLogo({super.key, required this.assetPath, this.size = 40});

  final String assetPath;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size * 0.28),
      child: Container(
        width: size,
        height: size,
        color: AppColors.surfaceElevated,
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
      ),
    );
  }
}
