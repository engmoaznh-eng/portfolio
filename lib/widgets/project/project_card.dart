import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../models/project_model.dart';
import 'project_image.dart';
import 'tech_badge.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project, required this.onTap});
  final Project project;
  final VoidCallback onTap;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _hovering ? -6 : 0, 0),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            border: Border.all(color: _hovering ? AppColors.accentBlue.withValues(alpha: 0.5) : AppColors.border),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: AppColors.accentBlue.withValues(alpha: 0.15),
                      blurRadius: 28,
                      offset: const Offset(0, 14),
                    ),
                  ]
                : [],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 16 / 10,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(color: AppColors.surfaceElevated),
                    AnimatedScale(
                      duration: const Duration(milliseconds: 250),
                      scale: _hovering ? 1.05 : 1.0,
                      child: project.hasLogo
                          ? ProjectImage(
                              assetPath: project.logoImage,
                              projectName: project.name,
                              fit: BoxFit.cover,
                            )
                          : ProjectImage(
                              assetPath: project.coverImage,
                              projectName: project.name,
                              fit: BoxFit.contain,
                            ),
                    ),
                    Positioned(
                      top: AppDimensions.spaceSm,
                      left: AppDimensions.spaceSm,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.background.withValues(alpha: 0.75),
                          borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                        ),
                        child: Text(project.category.label, style: AppTextStyles.bodySm),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppDimensions.spaceLg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.name, style: AppTextStyles.headingLg),
                    const SizedBox(height: AppDimensions.spaceXs),
                    Text(project.period, style: AppTextStyles.bodySm.copyWith(color: AppColors.textMuted)),
                    const SizedBox(height: AppDimensions.spaceMd),
                    Text(
                      project.shortDescription,
                      style: AppTextStyles.bodyMd,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (project.technologies.isNotEmpty) ...[
                      const SizedBox(height: AppDimensions.spaceMd),
                      Wrap(
                        spacing: AppDimensions.spaceSm,
                        runSpacing: AppDimensions.spaceSm,
                        children: [for (final tech in project.technologies.take(3)) TechBadge(label: tech)],
                      ),
                    ],
                    const SizedBox(height: AppDimensions.spaceMd),
                    Row(
                      children: [
                        Text(
                          AppStrings.viewDetails,
                          style: AppTextStyles.label.copyWith(color: AppColors.accentBlue),
                        ),
                        const SizedBox(width: 6),
                        Icon(Icons.arrow_forward_rounded, size: 14, color: AppColors.accentBlue),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
