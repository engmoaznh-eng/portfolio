import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/responsive/responsive.dart';
import '../../data/skills_data.dart';
import '../../models/skill_category_model.dart';
import '../../widgets/cards/section_container.dart';
import '../../widgets/cards/glass_card.dart';
import '../../widgets/common/section_heading.dart';
import '../../widgets/common/animated_fade_in.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.gridColumns(context, mobile: 1, tablet: 2, desktop: 2, wide: 4);

    return SectionContainer(
      backgroundColor: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(overline: 'Skills', title: AppStrings.skillsTitle),
          const SizedBox(height: AppDimensions.spaceXxl),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: SkillsData.categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: AppDimensions.spaceLg,
              mainAxisSpacing: AppDimensions.spaceLg,
              mainAxisExtent: 224,
            ),
            itemBuilder: (context, index) {
              final category = SkillsData.categories[index];
              return AnimatedFadeIn(
                delay: Duration(milliseconds: 60 * index),
                child: _SkillCategoryCard(category: category),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillCategoryCard extends StatelessWidget {
  const _SkillCategoryCard({required this.category});
  final SkillCategory category;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverElevate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.accentBlue.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
            ),
            alignment: Alignment.center,
            child: Icon(category.icon, color: AppColors.accentBlue, size: 22),
          ),
          const SizedBox(height: AppDimensions.spaceMd),
          Text(category.title, style: AppTextStyles.headingMd),
          const SizedBox(height: AppDimensions.spaceMd),
          Expanded(
            child: Wrap(
              spacing: AppDimensions.spaceSm,
              runSpacing: AppDimensions.spaceSm,
              children: [
                for (final skill in category.skills)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceElevated,
                      borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Text(skill, style: AppTextStyles.bodySm),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
