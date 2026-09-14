import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/responsive/responsive.dart';
import '../../data/education_data.dart';
import '../../models/education_model.dart';
import '../../widgets/cards/section_container.dart';
import '../../widgets/cards/glass_card.dart';
import '../../widgets/common/section_heading.dart';
import '../../widgets/common/animated_fade_in.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.gridColumns(context, mobile: 1, tablet: 2, desktop: 2, wide: 2);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(overline: 'Background', title: AppStrings.educationTitle),
          const SizedBox(height: AppDimensions.spaceXxl),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: EducationData.education.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: AppDimensions.spaceLg,
              mainAxisSpacing: AppDimensions.spaceLg,
              mainAxisExtent: 190,
            ),
            itemBuilder: (context, index) {
              final edu = EducationData.education[index];
              return AnimatedFadeIn(delay: Duration(milliseconds: 80 * index), child: _EducationCard(education: edu));
            },
          ),
        ],
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard({required this.education});
  final Education education;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverElevate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.accentPurple.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.school_rounded, color: AppColors.accentPurple, size: 20),
              ),
              const Spacer(),
              Text(education.period, style: AppTextStyles.bodySm.copyWith(color: AppColors.textMuted)),
            ],
          ),
          const SizedBox(height: AppDimensions.spaceMd),
          Text(education.degree, style: AppTextStyles.headingMd),
          const SizedBox(height: 4),
          Text(education.institution, style: AppTextStyles.bodySm.copyWith(color: AppColors.textSecondary)),
          if (education.description != null) ...[
            const SizedBox(height: AppDimensions.spaceSm),
            Text(
              education.description!,
              style: AppTextStyles.bodySm,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
