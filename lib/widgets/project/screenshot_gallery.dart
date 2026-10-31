import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import 'project_image.dart';

/// Screenshot grid with a full-screen lightbox on tap.
class ScreenshotGallery extends StatelessWidget {
  const ScreenshotGallery({super.key, required this.screenshots, required this.projectName});

  final List<String> screenshots;
  final String projectName;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: screenshots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppDimensions.spaceMd,
        mainAxisSpacing: AppDimensions.spaceMd,
        childAspectRatio: 16 / 10,
      ),
      itemBuilder: (context, index) {
        final path = screenshots[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _openLightbox(context, index),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  border: Border.all(color: AppColors.border),
                ),
                child: ProjectImage(assetPath: path, projectName: projectName, fit: BoxFit.contain),
              ),
            ),
          ),
        );
      },
    );
  }

  void _openLightbox(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.92),
      builder: (context) => _Lightbox(screenshots: screenshots, projectName: projectName, initialIndex: initialIndex),
    );
  }
}

class _Lightbox extends StatefulWidget {
  const _Lightbox({required this.screenshots, required this.projectName, required this.initialIndex});
  final List<String> screenshots;
  final String projectName;
  final int initialIndex;

  @override
  State<_Lightbox> createState() => _LightboxState();
}

class _LightboxState extends State<_Lightbox> {
  late int _index = widget.initialIndex;

  void _go(int delta) {
    setState(() => _index = (_index + delta) % widget.screenshots.length);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(AppDimensions.spaceLg),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenSize.width * 0.85,
              maxHeight: screenSize.height * 0.85,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
              child: ProjectImage(
                assetPath: widget.screenshots[_index],
                projectName: widget.projectName,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close_rounded, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          if (widget.screenshots.length > 1) ...[
            Positioned(
              left: 0,
              child: IconButton(
                icon: const Icon(Icons.chevron_left_rounded, color: Colors.white, size: 32),
                onPressed: () => _go(-1),
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.chevron_right_rounded, color: Colors.white, size: 32),
                onPressed: () => _go(1),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
