import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_dimensions.dart';

class SocialIconButton extends StatefulWidget {
  const SocialIconButton({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _hovering ? AppColors.surfaceElevated : Colors.transparent,
              borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
              border: Border.all(color: _hovering ? AppColors.accentBlue : AppColors.border),
            ),
            child: Icon(
              widget.icon,
              size: 18,
              color: _hovering ? AppColors.accentBlue : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
