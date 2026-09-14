import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/responsive/responsive.dart';
import '../../data/personal_data.dart';
import '../buttons/secondary_button.dart';
import '../buttons/social_icon_button.dart';
import 'mobile_nav_drawer.dart';

class NavItem {
  const NavItem(this.label, this.onTap);
  final String label;
  final VoidCallback onTap;
}

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.scrollController,
    required this.items,
    required this.onDownloadCv,
    required this.onOpenGithub,
    required this.onOpenLinkedin,
  });

  final ScrollController scrollController;
  final List<NavItem> items;
  final VoidCallback onDownloadCv;
  final VoidCallback? onOpenGithub;
  final VoidCallback? onOpenLinkedin;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 12;
    if (scrolled != _scrolled) setState(() => _scrolled = scrolled);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktopNav(context);
    final horizontalPadding = Responsive.isMobile(context) ? AppDimensions.spaceLg : AppDimensions.spaceXl;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: AppDimensions.navBarHeight,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        color: _scrolled ? AppColors.background.withValues(alpha: 0.85) : Colors.transparent,
        border: Border(
          bottom: BorderSide(color: _scrolled ? AppColors.border : Colors.transparent),
        ),
      ),
      child: Row(
        children: [
          _Logo(onTap: widget.items.isNotEmpty ? widget.items.first.onTap : null),
          const Spacer(),
          if (isDesktop) ...[
            for (final item in widget.items) _NavLink(item: item),
            const SizedBox(width: AppDimensions.spaceLg),
            if (widget.onOpenGithub != null)
              SocialIconButton(icon: FontAwesomeIcons.github, tooltip: 'GitHub', onPressed: widget.onOpenGithub!),
            if (widget.onOpenGithub != null) const SizedBox(width: AppDimensions.spaceSm),
            if (widget.onOpenLinkedin != null)
              SocialIconButton(
                  icon: FontAwesomeIcons.linkedin, tooltip: 'LinkedIn', onPressed: widget.onOpenLinkedin!),
            if (widget.onOpenLinkedin != null) const SizedBox(width: AppDimensions.spaceLg),
            SecondaryButton(
              label: AppStrings.ctaDownloadCv,
              icon: Icons.download_rounded,
              onPressed: widget.onDownloadCv,
            ),
          ] else
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu_rounded, color: AppColors.textPrimary),
                onPressed: () => openMobileNavDrawer(
                  context,
                  items: widget.items,
                  onDownloadCv: widget.onDownloadCv,
                  onOpenGithub: widget.onOpenGithub,
                  onOpenLinkedin: widget.onOpenLinkedin,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                gradient: AppColors.accentGradient,
                borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
              ),
              alignment: Alignment.center,
              child: Text(
                PersonalData.initials,
                style: AppTextStyles.headingMd.copyWith(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.item});
  final NavItem item;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.item.onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppDimensions.spaceMd),
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: _hovering ? AppColors.accentBlue : Colors.transparent, width: 2),
            ),
          ),
          child: Text(
            widget.item.label,
            style: AppTextStyles.bodyMd.copyWith(
              color: _hovering ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
