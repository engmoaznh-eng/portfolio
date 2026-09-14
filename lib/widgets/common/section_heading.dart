import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.overline,
    required this.title,
    this.subtitle,
    this.centered = false,
  });

  final String overline;
  final String title;
  final String? subtitle;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(overline.toUpperCase(), style: AppTextStyles.overline),
        const SizedBox(height: AppDimensions.spaceSm),
        Text(
          title,
          style: AppTextStyles.displayMd,
          textAlign: centered ? TextAlign.center : TextAlign.start,
        ),
        Container(
          margin: const EdgeInsets.only(top: AppDimensions.spaceMd),
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: AppDimensions.spaceMd),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              subtitle!,
              style: AppTextStyles.bodyLg,
              textAlign: centered ? TextAlign.center : TextAlign.start,
            ),
          ),
        ],
      ],
    );
  }
}
