import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/responsive/responsive.dart';
import '../../core/utils/url_launcher_util.dart';
import '../../models/project_model.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/buttons/secondary_button.dart';
import '../../widgets/project/project_image.dart';
import '../../widgets/project/tech_badge.dart';
import '../../widgets/project/screenshot_gallery.dart';

void showProjectDetails(BuildContext context, Project project) {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: true,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
        opacity: animation,
        child: ProjectDetailsView(project: project),
      ),
    ),
  );
}

class ProjectDetailsView extends StatelessWidget {
  const ProjectDetailsView({super.key, required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spaceLg, vertical: AppDimensions.spaceMd),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
                    onPressed: () => Navigator.of(context).pop(),
                    tooltip: AppStrings.close,
                  ),
                  const SizedBox(width: AppDimensions.spaceSm),
                  Text(project.name, style: AppTextStyles.headingMd),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.border),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? AppDimensions.spaceLg : AppDimensions.spaceXxl,
                  vertical: AppDimensions.spaceXl,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: AppDimensions.maxContentWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
                          child: Container(
                            color: AppColors.surfaceElevated,
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
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
                          ),
                        ),
                        const SizedBox(height: AppDimensions.spaceXl),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: AppDimensions.spaceMd,
                          runSpacing: AppDimensions.spaceSm,
                          children: [
                            Text(project.name, style: AppTextStyles.displaySm),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceElevated,
                                borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                              ),
                              child: Text(project.category.label, style: AppTextStyles.bodySm),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimensions.spaceXs),
                        Text(project.period, style: AppTextStyles.bodyMd.copyWith(color: AppColors.textMuted)),
                        const SizedBox(height: AppDimensions.spaceLg),
                        Text(project.description, style: AppTextStyles.bodyLg),
                        if (project.technologies.isNotEmpty) ...[
                          const SizedBox(height: AppDimensions.spaceXl),
                          Text(AppStrings.technologies, style: AppTextStyles.headingMd),
                          const SizedBox(height: AppDimensions.spaceMd),
                          Wrap(
                            spacing: AppDimensions.spaceSm,
                            runSpacing: AppDimensions.spaceSm,
                            children: [for (final tech in project.technologies) TechBadge(label: tech)],
                          ),
                        ],
                        if (project.githubUrl != null || project.liveUrl != null) ...[
                          const SizedBox(height: AppDimensions.spaceXl),
                          Wrap(
                            spacing: AppDimensions.spaceMd,
                            runSpacing: AppDimensions.spaceMd,
                            children: [
                              if (project.githubUrl != null)
                                SecondaryButton(
                                  label: AppStrings.viewOnGithub,
                                  icon: FontAwesomeIcons.github,
                                  onPressed: () => UrlLauncherUtil.openUrl(project.githubUrl!),
                                ),
                              if (project.liveUrl != null)
                                PrimaryButton(
                                  label: AppStrings.liveDemo,
                                  icon: Icons.open_in_new_rounded,
                                  onPressed: () => UrlLauncherUtil.openUrl(project.liveUrl!),
                                ),
                            ],
                          ),
                        ],
                        const SizedBox(height: AppDimensions.spaceXxl),
                        Text(AppStrings.screenshots, style: AppTextStyles.headingMd),
                        const SizedBox(height: AppDimensions.spaceMd),
                        ScreenshotGallery(screenshots: project.screenshots, projectName: project.name),
                        const SizedBox(height: AppDimensions.spaceXxl),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
