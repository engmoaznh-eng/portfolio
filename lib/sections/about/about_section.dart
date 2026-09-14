import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/responsive/responsive.dart';
import '../../data/personal_data.dart';
import '../../widgets/cards/section_container.dart';
import '../../widgets/cards/glass_card.dart';
import '../../widgets/common/section_heading.dart';
import '../../widgets/common/animated_fade_in.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    final summary = AnimatedFadeIn(
      child: Text(PersonalData.profileSummary, style: AppTextStyles.bodyLg),
    );

    final strengths = AnimatedFadeIn(
      delay: const Duration(milliseconds: 120),
      child: Wrap(
        spacing: AppDimensions.spaceMd,
        runSpacing: AppDimensions.spaceMd,
        children: [
          for (final strength in PersonalData.strengths) _StrengthChip(label: strength),
        ],
      ),
    );

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(overline: 'About', title: AppStrings.aboutTitle),
          const SizedBox(height: AppDimensions.spaceXxl),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 6, child: summary),
                const SizedBox(width: AppDimensions.spaceXxxl),
                Expanded(flex: 4, child: strengths),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                summary,
                const SizedBox(height: AppDimensions.spaceXl),
                strengths,
              ],
            ),
        ],
      ),
    );
  }
}

class _StrengthChip extends StatelessWidget {
  const _StrengthChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      hoverElevate: true,
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spaceLg, vertical: AppDimensions.spaceMd),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(gradient: AppColors.accentGradient, shape: BoxShape.circle),
          ),
          const SizedBox(width: AppDimensions.spaceMd),
          Text(label, style: AppTextStyles.headingMd),
        ],
      ),
    );
  }
}
