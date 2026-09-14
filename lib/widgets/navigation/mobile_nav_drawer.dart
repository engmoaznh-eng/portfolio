import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../buttons/primary_button.dart';
import 'nav_bar.dart';

void openMobileNavDrawer(
  BuildContext context, {
  required List<NavItem> items,
  required VoidCallback onDownloadCv,
  VoidCallback? onOpenGithub,
  VoidCallback? onOpenLinkedin,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.surface,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimensions.radiusLg)),
    ),
    builder: (sheetContext) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppDimensions.spaceLg,
            AppDimensions.spaceMd,
            AppDimensions.spaceLg,
            AppDimensions.spaceXl,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: AppDimensions.spaceLg),
                  decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2)),
                ),
              ),
              for (final item in items)
                ListTile(
                  title: Text(item.label, style: AppTextStyles.bodyLg.copyWith(color: AppColors.textPrimary)),
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    item.onTap();
                  },
                ),
              const SizedBox(height: AppDimensions.spaceMd),
              if (onOpenGithub != null || onOpenLinkedin != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (onOpenGithub != null)
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.github, color: AppColors.textSecondary),
                        onPressed: onOpenGithub,
                      ),
                    if (onOpenLinkedin != null)
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.linkedin, color: AppColors.textSecondary),
                        onPressed: onOpenLinkedin,
                      ),
                  ],
                ),
              const SizedBox(height: AppDimensions.spaceMd),
              PrimaryButton(
                label: AppStrings.ctaDownloadCv,
                icon: Icons.download_rounded,
                onPressed: onDownloadCv,
              ),
            ],
          ),
        ),
      );
    },
  );
}
