import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/responsive/responsive.dart';
import '../../core/utils/url_launcher_util.dart';
import '../../data/personal_data.dart';
import '../../widgets/cards/section_container.dart';
import '../../widgets/cards/glass_card.dart';
import '../../widgets/common/section_heading.dart';
import '../../widgets/common/animated_fade_in.dart';
import '../../widgets/buttons/primary_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return SectionContainer(
      backgroundColor: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            overline: 'Contact',
            title: AppStrings.contactTitle,
            subtitle: AppStrings.contactSubtitle,
          ),
          const SizedBox(height: AppDimensions.spaceXxl),
          if (isDesktop)
            const IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(flex: 4, child: _ContactInfoCard()),
                  SizedBox(width: AppDimensions.spaceLg),
                  Expanded(flex: 6, child: _ContactFormCard()),
                ],
              ),
            )
          else
            const Column(
              children: [
                _ContactInfoCard(),
                SizedBox(height: AppDimensions.spaceLg),
                _ContactFormCard(),
              ],
            ),
        ],
      ),
    );
  }
}

class _ContactInfoCard extends StatelessWidget {
  const _ContactInfoCard();

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeIn(
      child: GlassCard(
        hoverElevate: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ContactRow(
              icon: FontAwesomeIcons.envelope,
              label: 'Email',
              value: PersonalData.email,
              onTap: () => UrlLauncherUtil.openEmail(PersonalData.email),
            ),
            const SizedBox(height: AppDimensions.spaceLg),
            _ContactRow(
              icon: FontAwesomeIcons.phone,
              label: 'Phone',
              value: PersonalData.phone,
              onTap: () => UrlLauncherUtil.openPhone(PersonalData.phone),
            ),
            if (PersonalData.githubUrl != null) ...[
              const SizedBox(height: AppDimensions.spaceLg),
              _ContactRow(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                value: PersonalData.githubUrl!,
                onTap: () => UrlLauncherUtil.openUrl(PersonalData.githubUrl!),
              ),
            ],
            if (PersonalData.linkedinUrl != null) ...[
              const SizedBox(height: AppDimensions.spaceLg),
              _ContactRow(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                value: PersonalData.linkedinUrl!,
                onTap: () => UrlLauncherUtil.openUrl(PersonalData.linkedinUrl!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({required this.icon, required this.label, required this.value, required this.onTap});
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.accentBlue.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
              ),
              alignment: Alignment.center,
              child: Icon(icon, size: 16, color: AppColors.accentBlue),
            ),
            const SizedBox(width: AppDimensions.spaceMd),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: AppTextStyles.bodySm.copyWith(color: AppColors.textMuted)),
                  Text(value, style: AppTextStyles.bodyMd.copyWith(color: AppColors.textPrimary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactFormCard extends StatefulWidget {
  const _ContactFormCard();

  @override
  State<_ContactFormCard> createState() => _ContactFormCardState();
}

class _ContactFormCardState extends State<_ContactFormCard> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();
    final body = 'From: $name${email.isNotEmpty ? ' ($email)' : ''}\n\n$message';
    UrlLauncherUtil.openEmail(
      PersonalData.email,
      subject: name.isEmpty ? 'Portfolio inquiry' : 'Portfolio inquiry from $name',
      body: body,
    );
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      filled: true,
      fillColor: AppColors.surfaceElevated,
      contentPadding: const EdgeInsets.symmetric(horizontal: AppDimensions.spaceMd, vertical: AppDimensions.spaceMd),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
        borderSide: const BorderSide(color: AppColors.accentBlue),
      ),
    );

    return AnimatedFadeIn(
      delay: const Duration(milliseconds: 100),
      child: GlassCard(
        hoverElevate: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.textPrimary),
              decoration: inputDecoration.copyWith(hintText: 'Your name'),
            ),
            const SizedBox(height: AppDimensions.spaceMd),
            TextField(
              controller: _emailController,
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.textPrimary),
              decoration: inputDecoration.copyWith(hintText: 'Your email'),
            ),
            const SizedBox(height: AppDimensions.spaceMd),
            TextField(
              controller: _messageController,
              maxLines: 5,
              style: AppTextStyles.bodyMd.copyWith(color: AppColors.textPrimary),
              decoration: inputDecoration.copyWith(hintText: 'Your message'),
            ),
            const SizedBox(height: AppDimensions.spaceLg),
            PrimaryButton(label: AppStrings.ctaSendEmail, icon: Icons.send_rounded, onPressed: _submit),
            const SizedBox(height: AppDimensions.spaceSm),
            Text(
              'Opens your email client with this message pre-filled — this is a static site with no backend.',
              style: AppTextStyles.bodySm.copyWith(color: AppColors.textMuted),
            ),
          ],
        ),
      ),
    );
  }
}
