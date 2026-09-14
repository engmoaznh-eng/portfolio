import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/responsive/responsive.dart';
import '../../core/utils/url_launcher_util.dart';
import '../../data/personal_data.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/buttons/secondary_button.dart';
import '../../widgets/buttons/social_icon_button.dart';
import '../../widgets/common/animated_fade_in.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key, required this.onViewProjects});

  final VoidCallback onViewProjects;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 720),
      decoration: const BoxDecoration(
        color: AppColors.background,
        gradient: AppColors.heroGlow,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? AppDimensions.spaceLg : AppDimensions.spaceXl,
        vertical: AppDimensions.spaceXxxl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppDimensions.maxContentWidth),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: _HeroText(onViewProjects: onViewProjects)),
                    const SizedBox(width: AppDimensions.spaceXxxl),
                    const Expanded(flex: 5, child: _HeroVisual()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _HeroText(onViewProjects: onViewProjects, centered: true),
                    const SizedBox(height: AppDimensions.spaceXxl),
                    const _HeroVisual(),
                  ],
                ),
        ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText({required this.onViewProjects, this.centered = false});
  final VoidCallback onViewProjects;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    final crossAxis = centered ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final textAlign = centered ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment: crossAxis,
      children: [
        AnimatedFadeIn(
          child: Text(
            "Hi, I'm ${PersonalData.name}",
            style: AppTextStyles.overline,
            textAlign: textAlign,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceMd),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 80),
          child: Text(
            PersonalData.title,
            style: (centered ? AppTextStyles.displayLg : AppTextStyles.displayXl),
            textAlign: textAlign,
          ),
        ),
        const SizedBox(height: AppDimensions.spaceLg),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 160),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              PersonalData.heroIntro,
              style: AppTextStyles.bodyLg,
              textAlign: textAlign,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spaceXl),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 240),
          child: Wrap(
            alignment: centered ? WrapAlignment.center : WrapAlignment.start,
            spacing: AppDimensions.spaceMd,
            runSpacing: AppDimensions.spaceMd,
            children: [
              PrimaryButton(
                label: AppStrings.ctaViewProjects,
                icon: Icons.arrow_forward_rounded,
                onPressed: onViewProjects,
              ),
              SecondaryButton(
                label: AppStrings.ctaDownloadCv,
                icon: Icons.download_rounded,
                onPressed: UrlLauncherUtil.downloadCv,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDimensions.spaceXl),
        AnimatedFadeIn(
          delay: const Duration(milliseconds: 320),
          child: Row(
            mainAxisAlignment: centered ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              SocialIconButton(
                icon: FontAwesomeIcons.envelope,
                tooltip: PersonalData.email,
                onPressed: () => UrlLauncherUtil.openEmail(PersonalData.email),
              ),
              const SizedBox(width: AppDimensions.spaceSm),
              SocialIconButton(
                icon: FontAwesomeIcons.phone,
                tooltip: PersonalData.phone,
                onPressed: () => UrlLauncherUtil.openPhone(PersonalData.phone),
              ),
              if (PersonalData.githubUrl != null) ...[
                const SizedBox(width: AppDimensions.spaceSm),
                SocialIconButton(
                  icon: FontAwesomeIcons.github,
                  tooltip: 'GitHub',
                  onPressed: () => UrlLauncherUtil.openUrl(PersonalData.githubUrl!),
                ),
              ],
              if (PersonalData.linkedinUrl != null) ...[
                const SizedBox(width: AppDimensions.spaceSm),
                SocialIconButton(
                  icon: FontAwesomeIcons.linkedin,
                  tooltip: 'LinkedIn',
                  onPressed: () => UrlLauncherUtil.openUrl(PersonalData.linkedinUrl!),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Abstract "code editor" visual — deliberately not a stock photo.
class _HeroVisual extends StatelessWidget {
  const _HeroVisual();

  static const _lines = <List<_Token>>[
    [_Token('class ', AppColors.accentPurple), _Token('Developer ', AppColors.textPrimary), _Token('{', AppColors.textMuted)],
    [_Token('  name', AppColors.accentBlue), _Token(' = ', AppColors.textMuted), _Token("'Moaz Alnahas';", AppColors.textPrimary)],
    [_Token('  role', AppColors.accentBlue), _Token(' = ', AppColors.textMuted), _Token("'Flutter Developer';", AppColors.textPrimary)],
    [_Token('  focus', AppColors.accentBlue), _Token(' = [', AppColors.textMuted)],
    [_Token("    'Clean Architecture',", AppColors.textPrimary)],
    [_Token("    'BLoC',  'REST APIs',", AppColors.textPrimary)],
    [_Token('  ];', AppColors.textMuted)],
    [_Token('}', AppColors.textMuted)],
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeIn(
      delay: const Duration(milliseconds: 200),
      offset: 12,
      child: AspectRatio(
        aspectRatio: 1.05,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(color: AppColors.accentPurple.withValues(alpha: 0.12), blurRadius: 60, spreadRadius: 10),
            ],
          ),
          padding: const EdgeInsets.all(AppDimensions.spaceLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  _Dot(Color(0xFFFF5F57)),
                  SizedBox(width: 6),
                  _Dot(Color(0xFFFEBC2E)),
                  SizedBox(width: 6),
                  _Dot(Color(0xFF28C840)),
                ],
              ),
              const SizedBox(height: AppDimensions.spaceLg),
              Expanded(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final line in _lines)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                for (final token in line)
                                  TextSpan(
                                    text: token.text,
                                    style: TextStyle(
                                      color: token.color,
                                      fontFamily: 'monospace',
                                      fontSize: 14,
                                      height: 1.5,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Token {
  const _Token(this.text, this.color);
  final String text;
  final Color color;
}

class _Dot extends StatelessWidget {
  const _Dot(this.color);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(width: 11, height: 11, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }
}
