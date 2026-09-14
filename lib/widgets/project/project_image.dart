import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';

/// Renders a project image asset, falling back to a clearly-labeled
/// placeholder (not a broken-image icon, not a stock photo) when the file
/// hasn't been supplied yet. Once a real file is added at [assetPath] and
/// the app is rebuilt, it replaces the placeholder automatically.
class ProjectImage extends StatelessWidget {
  const ProjectImage({
    super.key,
    required this.assetPath,
    required this.projectName,
    this.fit = BoxFit.cover,
  });

  final String assetPath;
  final String projectName;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => _Placeholder(projectName: projectName, assetPath: assetPath),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.projectName, required this.assetPath});
  final String projectName;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        border: Border.all(color: AppColors.borderSubtle),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(AppDimensions.spaceMd),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.image_outlined, color: AppColors.textMuted, size: 28),
          const SizedBox(height: AppDimensions.spaceSm),
          Text(
            projectName,
            style: AppTextStyles.bodySm.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            'Image coming soon',
            style: AppTextStyles.bodySm.copyWith(color: AppColors.textMuted, fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
