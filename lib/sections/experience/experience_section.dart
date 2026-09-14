import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../data/experience_data.dart';
import '../../models/experience_model.dart';
import '../../widgets/cards/section_container.dart';
import '../../widgets/cards/glass_card.dart';
import '../../widgets/common/section_heading.dart';
import '../../widgets/common/animated_fade_in.dart';
import '../../widgets/project/tech_badge.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      backgroundColor: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(overline: 'Journey', title: AppStrings.experienceTitle),
          const SizedBox(height: AppDimensions.spaceXxl),
          for (int i = 0; i < ExperienceData.experiences.length; i++)
            AnimatedFadeIn(
              delay: Duration(milliseconds: 80 * i),
              child: _TimelineEntry(
                experience: ExperienceData.experiences[i],
                isLast: i == ExperienceData.experiences.length - 1 && ExperienceData.certifications.isEmpty,
              ),
            ),
          if (ExperienceData.certifications.isNotEmpty)
            AnimatedFadeIn(
              delay: Duration(milliseconds: 80 * ExperienceData.experiences.length),
              child: _CertificationsEntry(),
            ),
        ],
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({required this.experience, required this.isLast});
  final Experience experience;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                margin: const EdgeInsets.only(top: 4),
                decoration: const BoxDecoration(gradient: AppColors.accentGradient, shape: BoxShape.circle),
              ),
              if (!isLast) Expanded(child: Container(width: 2, color: AppColors.border)),
            ],
          ),
          const SizedBox(width: AppDimensions.spaceLg),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.spaceXl),
              child: GlassCard(
                hoverElevate: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: AppDimensions.spaceMd,
                      children: [
                        Text(experience.title, style: AppTextStyles.headingLg),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceElevated,
                            borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                          ),
                          child: Text(experience.period, style: AppTextStyles.bodySm),
                        ),
                      ],
                    ),
                    if (experience.company != null) ...[
                      const SizedBox(height: 4),
                      Text(experience.company!, style: AppTextStyles.bodyMd.copyWith(color: AppColors.accentBlue)),
                    ],
                    const SizedBox(height: AppDimensions.spaceMd),
                    Text(experience.description, style: AppTextStyles.bodyMd),
                    if (experience.technologies.isNotEmpty) ...[
                      const SizedBox(height: AppDimensions.spaceMd),
                      Wrap(
                        spacing: AppDimensions.spaceSm,
                        runSpacing: AppDimensions.spaceSm,
                        children: [for (final tech in experience.technologies) TechBadge(label: tech)],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CertificationsEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 14,
            height: 14,
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(color: AppColors.surfaceElevated, shape: BoxShape.circle, border: Border.all(color: AppColors.border)),
          ),
          const SizedBox(width: AppDimensions.spaceLg),
          Expanded(
            child: GlassCard(
              hoverElevate: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: AppDimensions.spaceMd,
                    children: [
                      Text('Courses & Certifications', style: AppTextStyles.headingLg),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceElevated,
                          borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                        ),
                        child: Text(ExperienceData.certificationsPeriod, style: AppTextStyles.bodySm),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spaceMd),
                  Wrap(
                    spacing: AppDimensions.spaceSm,
                    runSpacing: AppDimensions.spaceSm,
                    children: [for (final c in ExperienceData.certifications) TechBadge(label: c)],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
