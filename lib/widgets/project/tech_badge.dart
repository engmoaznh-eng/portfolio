import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';

class TechBadge extends StatelessWidget {
  const TechBadge({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.accentBlue.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
        border: Border.all(color: AppColors.accentBlue.withValues(alpha: 0.25)),
      ),
      child: Text(label, style: AppTextStyles.bodySm.copyWith(color: AppColors.accentBlue)),
    );
  }
}
